Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8A9020B249
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2020 15:15:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728051AbgFZNPe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jun 2020 09:15:34 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:34905 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726997AbgFZNPb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jun 2020 09:15:31 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id ooCSjk8fprl4BooCWjQuPm; Fri, 26 Jun 2020 15:15:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1593177329; bh=OFVnPuYmJQe1mABMBDfiFlU5o9wF/Nr/Nz4P3zQ/3Hk=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=TWaodN7QGy9MAMImfq8tPwr0Uru7e+yZNvPMag9Kca1Q/dlGez0ezeS7huHoPCPsj
         LB+GCTlNRtXPpHT1lzDyLJAM+Z3rsJVJBIhzBuf9BecXcVQlc7ejm+DrHRVYOTSeQs
         THng2SeFWA7NghfBpGU+ivcQRlocq263xQOpoZlxUc+XtuTkBeWQFGezv3BCIeNf/M
         Q9W9c4Ne2z/4z0m6ugyKJnPIjs5YPuyqPRwqSLqzixHczOkhAT7dJDDQYnFHMvzN8H
         Cgh9PPV80gVsBclTp7Y9SZ4TXyJu/Wgz2vl5Hg+1XFcdL8UAyCV1cN/XdNg/OP+MRc
         ZcvupyIZ+TsiA==
Subject: [PATCH] arch/sh/configs: remove obsolete CONFIG_SOC_CAMERA*
To:     linux-media@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-sh@vger.kernel.org,
        Yoshinori Sato <ysato@users.sourceforge.jp>
References: <20200626115321.1898798-1-hverkuil-cisco@xs4all.nl>
 <20200626115321.1898798-8-hverkuil-cisco@xs4all.nl>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <8d39ddaf-8779-3bc2-6344-a914f583ffb5@xs4all.nl>
Date:   Fri, 26 Jun 2020 15:15:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200626115321.1898798-8-hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfDc+XbCSLBCxgNe+VgFYTkfieVW3OtLCpRgubKLIE2k2NhEMaQbPiIXgyTLH+1Kus08Vt+KpJ1GTL+FeXrbJr6K7p8y52zHRTLxnmV94BpnCr+jW3kEB
 5L//ciXdPbMK4QyjoB2kPFkh+mHEqu3qdqY06niBi47DZoSPXjUVLxFARInVQe4i5YGaTtRVFMs6bI2R7QuTw6nncFIJOtAMNMG3/Sg5apfSOD36pJrNI9lf
 gT5cmc3NDw7d1gN8ZpuImnA+vN4Ap+4GUTpTla/QZmoJGIJkyvsv7kEfUC6SXyUX
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Drop all configs with the CONFIG_SOC_CAMERA prefix since those
have been removed.

SOC_CAMERA support for the sh architecture was removed a long time ago.
Drop it from the configs.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 arch/sh/configs/ap325rxa_defconfig | 3 ---
 arch/sh/configs/ecovec24_defconfig | 3 ---
 arch/sh/configs/migor_defconfig    | 3 ---
 arch/sh/configs/se7724_defconfig   | 2 --
 4 files changed, 11 deletions(-)

diff --git a/arch/sh/configs/ap325rxa_defconfig b/arch/sh/configs/ap325rxa_defconfig
index cc6e4ce53dac..5193b3e099b9 100644
--- a/arch/sh/configs/ap325rxa_defconfig
+++ b/arch/sh/configs/ap325rxa_defconfig
@@ -65,9 +65,6 @@ CONFIG_VIDEO_DEV=y
 # CONFIG_VIDEO_ALLOW_V4L1 is not set
 # CONFIG_MEDIA_TUNER_CUSTOMISE is not set
 CONFIG_VIDEO_HELPER_CHIPS_AUTO=y
-CONFIG_SOC_CAMERA=y
-CONFIG_SOC_CAMERA_PLATFORM=y
-CONFIG_SOC_CAMERA_OV772X=y
 CONFIG_VIDEO_SH_MOBILE_CEU=y
 # CONFIG_RADIO_ADAPTERS is not set
 CONFIG_FB=y
diff --git a/arch/sh/configs/ecovec24_defconfig b/arch/sh/configs/ecovec24_defconfig
index 2fb7db4957ce..03cb916819fa 100644
--- a/arch/sh/configs/ecovec24_defconfig
+++ b/arch/sh/configs/ecovec24_defconfig
@@ -72,9 +72,6 @@ CONFIG_MEDIA_SUPPORT=y
 CONFIG_VIDEO_DEV=y
 # CONFIG_MEDIA_TUNER_CUSTOMISE is not set
 CONFIG_VIDEO_HELPER_CHIPS_AUTO=y
-CONFIG_SOC_CAMERA=y
-CONFIG_SOC_CAMERA_MT9T112=y
-CONFIG_SOC_CAMERA_TW9910=y
 CONFIG_VIDEO_SH_MOBILE_CEU=y
 # CONFIG_V4L_USB_DRIVERS is not set
 CONFIG_FB=y
diff --git a/arch/sh/configs/migor_defconfig b/arch/sh/configs/migor_defconfig
index 494a1675c226..37e9521a99e5 100644
--- a/arch/sh/configs/migor_defconfig
+++ b/arch/sh/configs/migor_defconfig
@@ -62,9 +62,6 @@ CONFIG_VIDEO_DEV=y
 # CONFIG_VIDEO_ALLOW_V4L1 is not set
 # CONFIG_MEDIA_TUNER_CUSTOMISE is not set
 CONFIG_VIDEO_HELPER_CHIPS_AUTO=y
-CONFIG_SOC_CAMERA=y
-CONFIG_SOC_CAMERA_TW9910=y
-CONFIG_SOC_CAMERA_OV772X=y
 CONFIG_VIDEO_SH_MOBILE_CEU=y
 # CONFIG_RADIO_ADAPTERS is not set
 CONFIG_FB=y
diff --git a/arch/sh/configs/se7724_defconfig b/arch/sh/configs/se7724_defconfig
index 0e8d5cc1e107..a26f7f1841c7 100644
--- a/arch/sh/configs/se7724_defconfig
+++ b/arch/sh/configs/se7724_defconfig
@@ -70,8 +70,6 @@ CONFIG_VIDEO_DEV=y
 CONFIG_DVB_CORE=m
 # CONFIG_MEDIA_TUNER_CUSTOMISE is not set
 CONFIG_VIDEO_HELPER_CHIPS_AUTO=y
-CONFIG_SOC_CAMERA=y
-CONFIG_SOC_CAMERA_OV772X=y
 CONFIG_VIDEO_SH_MOBILE_CEU=y
 # CONFIG_RADIO_ADAPTERS is not set
 # CONFIG_DVB_FE_CUSTOMISE is not set
-- 
2.27.0


