Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C0F422975A
	for <lists+linux-media@lfdr.de>; Wed, 22 Jul 2020 13:26:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728171AbgGVLYv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jul 2020 07:24:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726028AbgGVLYu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jul 2020 07:24:50 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC1C7C0619DC;
        Wed, 22 Jul 2020 04:24:49 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id 207so1101533pfu.3;
        Wed, 22 Jul 2020 04:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=cgpkwo50wAGaYC/rXs15YWs5+nRoNKrSoWKyjDw624Q=;
        b=qSBLnaUUV0E6FfTZgptPLGtHJKXx5OuI/cQidFb5sK6gwMt1A1UVhZTVKGPUSeRa9/
         lcbnjA45JUxZZotbPt2qmA4PEIsDhovcD/92top2Kf4TVW9L8E199EPvp32WwPA5k6DD
         OmfkuH+SUQWCHnGS1p7ME1Kpm11lg93Q8O0GQH+ifJZmMIGpYsYPzF6jGIPh1dfvo6TX
         MFITft7JLUy4GVlAVczvwqOWNWe6/G8env1oFGXKbPmcf5iKMn3yB+rVxHi2bFWZwJVu
         9dRfTAmbqYLLyMEajCPmQ9E6rPp1PCDrW08RX/PleyTdWFNra94XtmSePX4U16nuV8Ny
         +VQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=cgpkwo50wAGaYC/rXs15YWs5+nRoNKrSoWKyjDw624Q=;
        b=FTgd6/JG03AsNedyCst7M1tbLjwKRntx41jZF4A4+5D5Rr0Ot9h1UsXtPKMv0X3dll
         2KPBCEEfp8LZawjxauRKSlwKrvssu1cAc2HNkNO7zfaofc8bqHzj51vER2NFzO/4lEa3
         dvgJXbyvVL4rz+mlA2PhAMCUAlr6Rz3WHrS8EHF/f4TepZqLOPeXH10S9d6koT9NsS+Z
         dMOvCbh0si/exfoewk7rME3PDATsslF/2PtMf8q9NVz8ru5agWXXXu3/255t0eg8pFmY
         zCwfvqgoRKcfydgC6oa+xMSt6sg7KAU0XOtBiz+hDXB07emHM8TsmPZesL1HmTufPu47
         yLAg==
X-Gm-Message-State: AOAM531bgnIO+4AW1LKta9cXqHzXeR6xEVIgeQfRq9dikvHR39vWvMId
        YzT1cSI3UGiBGhPkoS6YqPA=
X-Google-Smtp-Source: ABdhPJx8z9I3VJ24rt7UEKgKpY2MUAYyPCBxDm9+NsR+9yDB389i0QnBJ/AZej5bCAInZjLUszOMTw==
X-Received: by 2002:a65:594b:: with SMTP id g11mr27736716pgu.168.1595417089231;
        Wed, 22 Jul 2020 04:24:49 -0700 (PDT)
Received: from rahulg-ThinkPad-T450 ([122.175.73.180])
        by smtp.gmail.com with ESMTPSA id c132sm23411960pfb.112.2020.07.22.04.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2020 04:24:48 -0700 (PDT)
Date:   Wed, 22 Jul 2020 16:54:44 +0530
From:   Rahul Gottipati <rahul.blr97@gmail.com>
To:     mchehab@kernel.org
Cc:     sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] General coding style clean up
Message-ID: <cover.1595416585.git.rahul.blr97@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patchset fixes several checkpatch.pl warnings in atomisp_ioctl.c
that have been distributed across 2 patches logically.

Rahul Gottipati (2):
  media: atomisp: Fix coding style issue - remove beginning whitespaces
  media: atomisp: Fix coding style issue - correct multiline comments

 .../staging/media/atomisp/pci/atomisp_ioctl.c | 20 +++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

-- 
2.25.1

