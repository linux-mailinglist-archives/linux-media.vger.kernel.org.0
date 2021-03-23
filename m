Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FBAD34595A
	for <lists+linux-media@lfdr.de>; Tue, 23 Mar 2021 09:13:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229574AbhCWINE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Mar 2021 04:13:04 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:60783 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229448AbhCWIMw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Mar 2021 04:12:52 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id Oc9fluZTNUzyrOc9jlOgMO; Tue, 23 Mar 2021 09:12:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1616487171; bh=si62qUFtVqHm3iGlgzUb6oTu1eOhHNbIV0wze389Etw=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=tA72nz7XjbE0JnR+fh6MiNRu7JEJAfbJdBCDe1GtpjLuBQ9ri1xhpu62uX4jtZKXA
         GSL7wB8W85uiEClM9EXJbkPrdMsFJPzgj8D1F5NwAh5kpAg2wZto4EqYU4WFwkjwnT
         xxONdPBoM8Su8NpBLlz/TNuExZHdWyMTWYPkV4xtIiUaqSUIB7Jtqd70scTgE3y6B+
         LSendZuYmuTs7J7KCpJI+KF0XHsm0ScoCcr2/CpAfbDe+XT/2LSlpMeRCx7FQxUHa7
         aMY9AzGnerxsGEkTdymfPcbtXweDbTA5c4FdWJEDUozDbyQYD7ptraSO8EBBTngBI5
         yN6uXxiFgYmbQ==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] omap3isp.h: fix kernel-doc warnings
Message-ID: <6365fce1-3023-8058-8f7f-abb6426c10ad@xs4all.nl>
Date:   Tue, 23 Mar 2021 09:12:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfHbyv2+h73RWw0oT4q1lydJczMHXcJIWENkL/sr3Fq6RJbRfUrcAmJ39WG9BaV8WyZopEoYNakQrlZ6h/UnkGEeYLB+TmJ4hos+bDjohT12Vmu26qDBX
 b3o9FFG8rATQ5qdCvOFDrWqRoR+aYeZul6jJqcHu0f3cAomBQYD1YDR7Hk6Q+EViwpYmSv5iGNkAct7RY5P6LdH5zxcWmQ5H/jW0FvTmTzTd2XFYFLNCoX1x
 AEP1Tm54BaJh2IkmghVASw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add missing documentation for two field. This fixes these kernel-doc
warnings:

drivers/media/platform/omap3isp/omap3isp.h:107: warning: Function parameter or member 'vp_clk_pol' not described in 'isp_ccp2_cfg'
drivers/media/platform/omap3isp/omap3isp.h:107: warning: Function parameter or member 'lanecfg' not described in 'isp_ccp2_cfg'

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/media/platform/omap3isp/omap3isp.h b/drivers/media/platform/omap3isp/omap3isp.h
index 214f94c46a9d..4a003c8263ed 100644
--- a/drivers/media/platform/omap3isp/omap3isp.h
+++ b/drivers/media/platform/omap3isp/omap3isp.h
@@ -95,6 +95,8 @@ struct isp_csiphy_lanes_cfg {
  *		ISP_CCP2_PHY_DATA_CLOCK - Data/clock physical layer
  *		ISP_CCP2_PHY_DATA_STROBE - Data/strobe physical layer
  * @vpclk_div: Video port output clock control
+ * @vp_clk_pol: Video port output clock polarity
+ * @lanecfg: CCP2/CSI2 lane configuration
  */
 struct isp_ccp2_cfg {
 	unsigned int strobe_clk_pol:1;
