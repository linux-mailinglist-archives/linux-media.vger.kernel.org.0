Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 269067BF332
	for <lists+linux-media@lfdr.de>; Tue, 10 Oct 2023 08:40:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442267AbjJJGkW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Oct 2023 02:40:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442233AbjJJGkT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Oct 2023 02:40:19 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 751EE97
        for <linux-media@vger.kernel.org>; Mon,  9 Oct 2023 23:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696920019; x=1728456019;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Jcf3xMlyuvJ6c82/g12ueD5+8ixUnzk6WS67zaEVUF4=;
  b=Hnl+/HcFMP2cJQNjHej8aSmRfxfdtWaFLA88jUMw90kVCxL2EamMmgYa
   4b7+nfByiiK/e62NHArgRVKz7K3f7bifiYRp4mltevBhMHrt6y59Qv4vQ
   Z2S8LCceUgn9AbHBpOzn45BNgaxuyQ8kFeFTuBu9tybI8Q1bK6NM3vkhN
   eQapnTr4KLe1PgY67nr/5zwb0orWfwhQqRDM0dyXOM06QzLEwKUvc3hPm
   FRRBwdSZqh2xXh39vDgS7nQpUBAFtuwuRw6Uo7/t7LYLdvMKEWpsedavS
   G0zhOiaIKISASK//ak6vA9Hvm27yWcxIe6AWDqTE3g8DW/3fPfz8wX7Oi
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="5879827"
X-IronPort-AV: E=Sophos;i="6.03,211,1694761200"; 
   d="scan'208";a="5879827"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 23:40:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="703192019"
X-IronPort-AV: E=Sophos;i="6.03,211,1694761200"; 
   d="scan'208";a="703192019"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 23:40:16 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 267C511F8DE;
        Tue, 10 Oct 2023 09:40:14 +0300 (EEST)
Date:   Tue, 10 Oct 2023 06:40:14 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 2/9] media: i2c: adp1653: don't reuse the same node
 pointer
Message-ID: <ZSTxzr3SK/DP314Q@kekkonen.localdomain>
References: <cover.1696586632.git.hverkuil-cisco@xs4all.nl>
 <d256fa0415e10deb0f07a77d73475e063552bd17.1696586632.git.hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d256fa0415e10deb0f07a77d73475e063552bd17.1696586632.git.hverkuil-cisco@xs4all.nl>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 06, 2023 at 12:08:43PM +0200, Hans Verkuil wrote:
> The child device_node pointer was used for two different childs.
> This confused smatch, causing this warning:
> 
> drivers/media/i2c/adp1653.c:444 adp1653_of_init() warn: missing unwind goto?
> 
> Use two different pointers, one for each child node, and add separate
> goto labels for each node as well. This also improves error logging
> since it will now state for which node the property was missing.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> CC: Sakari Ailus <sakari.ailus@linux.intel.com>

Thanks!

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
