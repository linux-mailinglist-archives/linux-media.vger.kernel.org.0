Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 403102FCE6F
	for <lists+linux-media@lfdr.de>; Wed, 20 Jan 2021 11:55:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387671AbhATKlp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Jan 2021 05:41:45 -0500
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:38111 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731667AbhATJop (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Jan 2021 04:44:45 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 2A14lJCTVftvz2A1Bl8jFd; Wed, 20 Jan 2021 10:43:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1611135793; bh=E5z65qRlZQuYEUTcnzqsRIcp4AaIXPW+rtHHdPXH8zE=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=MkGlxY3+17hEJvpqBcIu6bAb4ttszPfneF7xq/hmPSRJEijwgJQcC8acnExcIRwLI
         yFwixOtqwt9ot5AruQa7T99C3fyFytkH15xqCTevrGjqnhC2D6roHWeL75pqkAro3U
         kdmjUNuEg5sRfFFPo66S94Wg3ZaCWNZSCGU6bBnUxcA1sxnZSH7Bl/hbC9XfNLvHKm
         mo177o6cripID3VMfILIY82Di/YvAcU7gE1/BiZ7rKwbpyhJUcmRhknImoXkKt2NGy
         qLda0TP/Ddxxu/QLIdEOid5bGsd0SSF1MUkzl2CKag6NZAlzb+h+zbSyYq7BfLQKNr
         iE/tfzBdIifxA==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 12/14] dvb-frontends/af9033.c: fix missing error codes
Date:   Wed, 20 Jan 2021 10:43:04 +0100
Message-Id: <20210120094306.784318-13-hverkuil-cisco@xs4all.nl>
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

Fixes two smatch warnings:

drivers/media/dvb-frontends/af9033.c:128 af9033_init() warn: missing error code 'ret'
drivers/media/dvb-frontends/af9033.c:855 af9033_read_snr() warn: missing error code 'ret'

Set error codes correctly.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/dvb-frontends/af9033.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/dvb-frontends/af9033.c b/drivers/media/dvb-frontends/af9033.c
index 6a8d78b6edac..785c49b3d307 100644
--- a/drivers/media/dvb-frontends/af9033.c
+++ b/drivers/media/dvb-frontends/af9033.c
@@ -125,6 +125,7 @@ static int af9033_init(struct dvb_frontend *fe)
 	if (i == ARRAY_SIZE(clock_adc_lut)) {
 		dev_err(&client->dev, "Couldn't find ADC config for clock %d\n",
 			dev->cfg.clock);
+		ret = -ENODEV;
 		goto err;
 	}
 
@@ -852,6 +853,7 @@ static int af9033_read_snr(struct dvb_frontend *fe, u16 *snr)
 				*snr = *snr * 0xffff / 32;
 				break;
 			default:
+				ret = -EINVAL;
 				goto err;
 			}
 		}
-- 
2.29.2

