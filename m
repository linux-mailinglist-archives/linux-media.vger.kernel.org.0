Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2218312DE4B
	for <lists+linux-media@lfdr.de>; Wed,  1 Jan 2020 09:21:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726640AbgAAIUN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Jan 2020 03:20:13 -0500
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:56920 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725916AbgAAIUM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 1 Jan 2020 03:20:12 -0500
X-IronPort-AV: E=Sophos;i="5.69,382,1571695200"; 
   d="scan'208";a="429578752"
Received: from palace.rsr.lip6.fr (HELO palace.lip6.fr) ([132.227.105.202])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/AES128-SHA256; 01 Jan 2020 09:20:08 +0100
From:   Julia Lawall <Julia.Lawall@inria.fr>
To:     Antti Palosaari <crope@iki.fi>
Cc:     kernel-janitors@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 03/16] [media] anysee: constify copied structure
Date:   Wed,  1 Jan 2020 08:43:21 +0100
Message-Id: <1577864614-5543-4-git-send-email-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1577864614-5543-1-git-send-email-Julia.Lawall@inria.fr>
References: <1577864614-5543-1-git-send-email-Julia.Lawall@inria.fr>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The anysee_tda18212_config and anysee_tda18212_config2 structures
are only copied into other structures, so make them const.

The opportunity for this change was found using Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/media/usb/dvb-usb-v2/anysee.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/dvb-usb-v2/anysee.c b/drivers/media/usb/dvb-usb-v2/anysee.c
index fb6d99dea31a..94b8d3e5d8f7 100644
--- a/drivers/media/usb/dvb-usb-v2/anysee.c
+++ b/drivers/media/usb/dvb-usb-v2/anysee.c
@@ -318,14 +318,14 @@ static struct tda10023_config anysee_tda10023_tda18212_config = {
 	.deltaf = 0xba02,
 };
 
-static struct tda18212_config anysee_tda18212_config = {
+static const struct tda18212_config anysee_tda18212_config = {
 	.if_dvbt_6 = 4150,
 	.if_dvbt_7 = 4150,
 	.if_dvbt_8 = 4150,
 	.if_dvbc = 5000,
 };
 
-static struct tda18212_config anysee_tda18212_config2 = {
+static const struct tda18212_config anysee_tda18212_config2 = {
 	.if_dvbt_6 = 3550,
 	.if_dvbt_7 = 3700,
 	.if_dvbt_8 = 4150,

