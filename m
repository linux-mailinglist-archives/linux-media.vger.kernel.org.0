Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53C727E1C92
	for <lists+linux-media@lfdr.de>; Mon,  6 Nov 2023 09:45:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231168AbjKFIpv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Nov 2023 03:45:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230466AbjKFIpu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Nov 2023 03:45:50 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B2A983
        for <linux-media@vger.kernel.org>; Mon,  6 Nov 2023 00:45:48 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44892C433C8;
        Mon,  6 Nov 2023 08:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1699260347;
        bh=5xXvKddmOjkdvmlwD2/AMNw96AW1goSPQvOR6hvcnSY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pxZpzL8V3jwPQhb6yPwdi0HNmb1wBHdOZ5HiIEIFeQa8GS8p/5c+oytF+XeY4mm50
         /zlSiUdM/Mwmz4HGgrhr83xZ7cc1GV9PeYCtBPVwuetEcIuoQeTUF8iNyAQQ4ONEl5
         CiZX14JqbsAA+oLXtqUfmQ2xszB5JwnE9W1POUoY=
Date:   Mon, 6 Nov 2023 09:45:45 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
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
        rafael@kernel.org
Subject: Re: [RESEND PATCH v4 1/1] device property: Add fwnode_name_eq()
Message-ID: <2023110623-alongside-credible-833d@gregkh>
References: <20231106073141.1250344-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231106073141.1250344-1-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Nov 06, 2023 at 09:31:41AM +0200, Sakari Ailus wrote:
> Add fwnode_name_eq() to implement the functionality of of_node_name_eq()
> on fwnode property API. The same convention of ending the comparison at
> '@' (besides NUL) is applied on also both ACPI and swnode. The function
> is intended for comparing unit address-less node names on DT and firmware
> or swnodes compliant with DT bindings.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Tested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Acked-by: Rafael J. Wysocki <rafael@kernel.org>
> ---
> Hi Greg,
> 
> Could we merge this via the media tree?

For 6.8-rc1?  Sure, feel free to:

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

