Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEFE42FCE6E
	for <lists+linux-media@lfdr.de>; Wed, 20 Jan 2021 11:55:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387661AbhATKlk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Jan 2021 05:41:40 -0500
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:49445 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731657AbhATJoo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Jan 2021 04:44:44 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 2A14lJCTVftvz2A1Bl8jFW; Wed, 20 Jan 2021 10:43:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1611135793; bh=Wk05yQtqStxFJUKVqNfq5qjxGWd/CT0EeCirjMw2RFg=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=hiP5ziZ6oBuG98xtt3sF6WP0yubAbncKHfoiTuo/ZWG/pXuHvLUQX6r3hPCP94eQi
         jRfoXc4jTSbC1mFiDwwlMjOImvxedC38AYQu9hvUJsAh3CWVV5cPCGQL1Kgjt4baDE
         cX+EBA9iNoIsKArmKMjzcdKZFdAo0Z80vLrbJlZMiI1iKeyX9+sFaGOnVn2i/KEywx
         q8sIzZNc/tsoSfvG3VzyJYSlYOXSH00zP1NfT3xkUJAt7qVnx9gU9x87BD5IRHAkdn
         wru/BguMWwcmDdv2cliTa54Qq42XUx9bLbFigYMP1Lqa18ba9latboX+GGhHx49WSk
         IccIUTVOk0Ulw==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 11/14] dvb-frontends/rtl2832.c: fix missing error code
Date:   Wed, 20 Jan 2021 10:43:03 +0100
Message-Id: <20210120094306.784318-12-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210120094306.784318-1-hverkuil-cisco@xs4all.nl>
References: <20210120094306.784318-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfAX5slZdcEG06gClf1fIbSEcdCCiibSaO57tXMNZ1RIGZ6Bnhop5RCmAwSDRBq0pMH9u1fnxz2YJnBjddl0CUTNYr+CsDS0ZgH7HSCI/FBqqF/Lc17c1
 spMTuaX3EY59qmTlxUrh7WdPKN+QMvl/ueTCuoV7ce54KMRIJcbPGXQgqeDUKYloleGy3kY3NfG34FOIu/4gLICuUcAx8qvPQhkcY/j7Cxe5kgNgO9ercodC
 59IpAWQKL4x5TIxzCbqj6A==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes this smatch warning:

drivers/media/dvb-frontends/rtl2832.c:702 rtl2832_read_status() warn: missing error code 'ret'

'ret' is indeed not set, so set it to -EINVAL so a proper error
code is returned.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/dvb-frontends/rtl2832.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/dvb-frontends/rtl2832.c b/drivers/media/dvb-frontends/rtl2832.c
index 01dcc7f1b9b2..dcbeb9f5e12a 100644
--- a/drivers/media/dvb-frontends/rtl2832.c
+++ b/drivers/media/dvb-frontends/rtl2832.c
@@ -698,6 +698,7 @@ static int rtl2832_read_status(struct dvb_frontend *fe, enum fe_status *status)
 			goto err;
 
 		constellation = (u8tmp >> 2) & 0x03; /* [3:2] */
+		ret = -EINVAL;
 		if (constellation > CONSTELLATION_NUM - 1)
 			goto err;
 
-- 
2.29.2

