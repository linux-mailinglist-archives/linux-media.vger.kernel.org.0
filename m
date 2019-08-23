Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BAFE09ADEA
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2019 13:13:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727020AbfHWLNF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Aug 2019 07:13:05 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:51015 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726634AbfHWLNF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Aug 2019 07:13:05 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 17V6ikQhOThuu17V9ioisO; Fri, 23 Aug 2019 13:13:03 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
        Dariusz Marcinkiewicz <darekm@google.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH for v5.3] cec-notifier: clear cec_adap in
 cec_notifier_unregister
Message-ID: <9e1f5b53-a717-ad8c-ef23-bf0722a31b31@xs4all.nl>
Date:   Fri, 23 Aug 2019 13:12:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfHy51X+54zsvnNmUern5YMsETJnPx6KgPZiFRJAIH9r/Eims+z2zLPFFRija6ny0CfuT8YyRfQpfohOYcSZLFBLn1ZtD1sBxRAkq7sA5r9IITuQtcthn
 PLt8UdWRDT7w4838WvOzuugcisCmGin8lzwfDJ6Su/qwK4TvmumtO0UmJSuQDYqk9O7Hz1kQG14rToSDe5l/YA8z0KhNjsz7qkvhDTkD3Q+641ESfwLZv4Fp
 OkNm/l0UjoYzLA88sJrfVmKVJtw7LNW6TpYInvnugK8=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If cec_notifier_cec_adap_unregister() is called before
cec_unregister_adapter() then everything is OK (and this is the
case today). But if it is the other way around, then
cec_notifier_unregister() is called first, and that doesn't
set n->cec_adap to NULL.

So if e.g. cec_notifier_set_phys_addr() is called after
cec_notifier_unregister() but before cec_unregister_adapter()
then n->cec_adap points to an unregistered and likely deleted
cec adapter. So just set n->cec_adap->notifier and n->cec_adap
to NULL for rubustness.

Eventually cec_notifier_unregister will disappear and this will
be simplified substantially.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/cec/cec-notifier.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/cec/cec-notifier.c b/drivers/media/cec/cec-notifier.c
index 52a867bde15f..4d82a5522072 100644
--- a/drivers/media/cec/cec-notifier.c
+++ b/drivers/media/cec/cec-notifier.c
@@ -218,6 +218,8 @@ void cec_notifier_unregister(struct cec_notifier *n)

 	mutex_lock(&n->lock);
 	n->callback = NULL;
+	n->cec_adap->notifier = NULL;
+	n->cec_adap = NULL;
 	mutex_unlock(&n->lock);
 	cec_notifier_put(n);
 }
-- 
2.20.1

