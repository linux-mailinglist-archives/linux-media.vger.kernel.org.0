Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF94067A8A5
	for <lists+linux-media@lfdr.de>; Wed, 25 Jan 2023 03:16:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230048AbjAYCQz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Jan 2023 21:16:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229625AbjAYCQz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Jan 2023 21:16:55 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E33127986;
        Tue, 24 Jan 2023 18:16:54 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D3B59B816C6;
        Wed, 25 Jan 2023 02:16:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F002FC433EF;
        Wed, 25 Jan 2023 02:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674613011;
        bh=zZoiazOdr0WVIgnfYHUQMchhbVuc3yE58s/t/MbFb/M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rfYtBn0/kLxdndFPFB/peNmT7my0W5DSbnUTufb8LrtKnzGt4nyu5Kobxr19VcVae
         CgH0cN2/SoWPzynaXi4divhYZ0iMOM6MXPAyOwfJXtUNZxTBlDIFUFCNGYL3gbrctp
         moiYjlVdr8ftyFQEBuvQ8LJgedURQOsTfc/icFcKQp1eN0w5i3LiFBGzPfpLqzQiEd
         LErVKgwlm2eNC6ch3v5MG+RoIPnHRNpflUcgZGoyag32kN+kdmCofbocaZP+BX42G6
         i+AucnGRVtC+2W3IeeUwT5A7s1GNOd7qLdkwt2L04c9nLnHME9+80CnDSUyr5c2uFH
         GFSJRrQSxcFow==
Date:   Wed, 25 Jan 2023 10:16:44 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v3 3/6] ARM: dts: freescale: Use new media bus type macros
Message-ID: <20230125021643.GA20713@T480>
References: <20220615221410.27459-1-laurent.pinchart@ideasonboard.com>
 <20220615221410.27459-4-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220615221410.27459-4-laurent.pinchart@ideasonboard.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jun 16, 2022 at 01:14:07AM +0300, Laurent Pinchart wrote:
> Now that a header exists with macros for the media interface bus-type
> values, replace hardcoding numerical constants with the corresponding
> macros in the DT sources.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Applied, thanks!
