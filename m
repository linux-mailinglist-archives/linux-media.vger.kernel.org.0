Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EF9D3A93AF
	for <lists+linux-media@lfdr.de>; Wed, 16 Jun 2021 09:22:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231560AbhFPHYb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Jun 2021 03:24:31 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:33145 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231239AbhFPHYa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Jun 2021 03:24:30 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id tPsSlgGqohg8ZtPsVlQCXB; Wed, 16 Jun 2021 09:22:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1623828143; bh=vQSJx8AO0R5qD2naHVw5TJxjJnbqHmcVSFNGZdfyq3w=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=WP3qK6LvnSLNmftZQuUSKVHdunnbYsGczvQbYvjakcqJbWl02w/F1G1MQvjau131H
         b5/gZ/PMQ9AjLNVa1UbZTJ56LG/+ekQO3wE03dGTry/Qewyq1UBwsRGIm1qpbhVQIp
         FSXMjErLZueKE3Fnc6boxt7qnR/RFVymBhltcnqtEPs79jwKJuJRExDQ+2dTdELJdI
         SqkoBUoCVe1nHzkTRujgtnQGMr7OLkiKoR+kHxv496ZyFe+tlKfAdAhD2xypHQ9SZL
         h0PzZI6XGc6ogpecMR4XMVF0IEXk59ZZAW5TTCG1y1LOS995CczoYNEYAsmIeWhtJd
         PiQzZbbKnhGYg==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Johan Fjeldtvedt <jaffe1@gmail.com>,
        Deborah Brouwer <deborahbrouwer3563@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] vivid: increase max number of allowed
Message-ID: <bcc850ec-4ba3-e7db-96aa-85424d1b6826@xs4all.nl>
Date:   Wed, 16 Jun 2021 09:22:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfOo/G6VymThlYwrCEq0/dCA1Mw6LyZcqlmv5kfD6Hcv0CZNADWq/IfL+qJVqYmzh1ZmRQ+VANQsDYGkNYdBF4KRG4nz1xzYdKSHeJFUAJxJZnVSKn36J
 xe1xn6JOCvZ9AgF23IZNYDaBkVhX6L8tQ5kes/6iUTYY0Ad4TuCqi/RBQ5sOASsioD2CVRyN9Hg/Ol2dvQ1s3oS7ROM7Z8Vl+5QU7IJ5+ZmgVWyV4mNhuc7V
 VCHgXMXvdTSjx7CCnRpYKofmHgleoPsU5/iFPAdmRf4=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The max number of allowed logical addresses was set to 1 in
vivid, for no good reason. This prevented testing with multiple
logical addresses for the same CEC device. Increase this number to
CEC_MAX_LOG_ADDRS.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/media/test-drivers/vivid/vivid-cec.c b/drivers/media/test-drivers/vivid/vivid-cec.c
index 4d2413e87730..55ea039fe5b2 100644
--- a/drivers/media/test-drivers/vivid/vivid-cec.c
+++ b/drivers/media/test-drivers/vivid/vivid-cec.c
@@ -282,5 +282,5 @@ struct cec_adapter *vivid_cec_alloc_adap(struct vivid_dev *dev,
 	snprintf(name, sizeof(name), "vivid-%03d-vid-%s%d",
 		 dev->inst, is_source ? "out" : "cap", idx);
 	return cec_allocate_adapter(&vivid_cec_adap_ops, dev,
-		name, caps, 1);
+				    name, caps, CEC_MAX_LOG_ADDRS);
 }
