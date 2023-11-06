Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 909B67E1AB0
	for <lists+linux-media@lfdr.de>; Mon,  6 Nov 2023 08:06:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230424AbjKFHGW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Nov 2023 02:06:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229717AbjKFHGV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Nov 2023 02:06:21 -0500
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFC0FC6;
        Sun,  5 Nov 2023 23:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699254378; x=1730790378;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=G9ErlH/+M/Rbhu99aimM6BxS7FI2wLaofzX009O7Z7A=;
  b=WD09d0maJobWJ55CNTzidDuyJqKJxSsA/qD1+vWRYxEAnd/pFFHfyZd1
   MIJWZX3JlS+KRYT615erLp9QG/6uZ/aTuv47rIi3xy3qs9SUsCuBAneBY
   0ssueZRLAt83Utjw7S0lBQ2sgxTCV5pVjvg3pRIroWsTpwIh5GjVuEZCX
   S1Xiyor/24SP6LGzF6fPX0GB14ykK4Qm/O3W5wc1cgq0M3SxJyXuJJtfU
   Uyd2Sv43behrLG1/UjcxuQgv6CDb9AhZWVlcGJ1bDNbSVhVwajbgnaLu3
   pc12bUZgPz4si44x2u4yGG2SlDrtfGPfvgbZy59EFG5pXjQDCTqzMRm0l
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="420334506"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="420334506"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 23:06:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="828122027"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="828122027"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 23:06:14 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 7DCEC11F724;
        Mon,  6 Nov 2023 09:06:11 +0200 (EET)
Date:   Mon, 6 Nov 2023 07:06:11 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     linux-acpi@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-media@vger.kernel.org,
        Paul Elder <paul.elder@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Julien Stephan <jstephan@baylibre.com>,
        devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v3 1/1] device property: Add fwnode_name_eq()
Message-ID: <ZUiQY9s0DKmkbzAR@kekkonen.localdomain>
References: <20231102081611.1179964-1-sakari.ailus@linux.intel.com>
 <CAJZ5v0h5q__nbfxLUN-cZDSvjTCJHSZwoDEz_cq+bUJGSn1u-A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJZ5v0h5q__nbfxLUN-cZDSvjTCJHSZwoDEz_cq+bUJGSn1u-A@mail.gmail.com>
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rafael,

On Fri, Nov 03, 2023 at 03:48:23PM +0100, Rafael J. Wysocki wrote:
> On Thu, Nov 2, 2023 at 9:22 AM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> >
> > Add fwnode_name_eq() to implement the functionality of of_node_name_eq()
> > on fwnode property API. The same convention of ending the comparison at
> > '@' (besides NUL) is applied on also both ACPI and swnode. The function
> > is intended for comparing unit address-less node names on DT and firmware
> > or swnodes compliant with DT bindings.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Tested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> > Hi Rafael,
> >
> > Could we merge this via the media tree (pending further review comments,
> > if any)?
> 
> This would be fine with me, so please feel free to add
> 
> Acked-by: Rafael J. Wysocki <rafael@kernel.org>

Thanks!

> 
> to this patch (when ready), but you need to ask Greg about it, because
> he's been handling device properties changes lately.

I must have missed this somehow... I'll resend v4.

-- 
Regards,

Sakari Ailus
