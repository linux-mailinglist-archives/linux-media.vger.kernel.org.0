Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BDDC7D372B
	for <lists+linux-media@lfdr.de>; Mon, 23 Oct 2023 14:49:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229615AbjJWMtb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Oct 2023 08:49:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229613AbjJWMta (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Oct 2023 08:49:30 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84635102
        for <linux-media@vger.kernel.org>; Mon, 23 Oct 2023 05:49:26 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E356FD20;
        Mon, 23 Oct 2023 14:49:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698065352;
        bh=ivFz5GFg4SiRlS3hwzXr5N8KSMhAH2Cto/Y5YfdiWWU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=f0dhWMP/wcYlkkN4J5SPeA2rxvldD8HRStmjiemJL/RUGkSGoI6hnnXSX9n+xtpHk
         GyvW66KlJDUkY1W5A3vZBxtGQh9WLh8Qy05QL3cW42JRRB1GCLnHdYiD31v5U4UJ9m
         t8RLxKCmELynMvKoBu8J+fCxS2O9Zw5fGpBbqr7M=
Date:   Mon, 23 Oct 2023 15:49:30 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jules Irenge <jbi.octave@gmail.com>
Cc:     linux-media@vger.kernel.org
Subject: Re:
Message-ID: <20231023124930.GM3336@pendragon.ideasonboard.com>
References: <CAOuULM555ZNXbsbZywJ8qkcNGbP+hdgBihqqEBYF_oA-FK2fxQ@mail.gmail.com>
 <20231022202253.GA5445@pendragon.ideasonboard.com>
 <ZTZhVY0Qa_03srJK@octux.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZTZhVY0Qa_03srJK@octux.home>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Jules,

On Mon, Oct 23, 2023 at 01:04:37PM +0100, Jules Irenge wrote:
> On Sun, Oct 22, 2023 at 11:22:53PM +0300, Laurent Pinchart wrote:
> Hi Laurent,
> 
> Thanks for replying.
> 
> > The driver has most likely bit-rotten over the last few years, as to my
> > knowledge nobody has really tested it recently. The first step would
> > thus be to try to capture images and see how it behaves (or doesn't
> > behave).
> 
> This looks like an opportunity for me.  
> 
> > What hardware will you use for testing ?
> 
> About that, I have my PC and a rasberry pi. Would you have an advise
> on which device  I can best use to test ?

You will need a development board with an OMAP4 SoC, and a compatible
camera module. I've used the PandaBoard ([1]) personally back when I
worked on the driver, but I don't recall what camera module I was using.
Looking at ancient git branches, it may have been based on an AR0330,
possibly using a module from Leopard Imaging. This was nearly 10 years
ago though, sourcing the hardware may be fairly difficult.

[1] https://www.digikey.fi/en/product-highlight/t/texas-instruments/pandaboard

> If I have to purchase, I can do that as this is just for my learning
> and contribution purpose.

-- 
Regards,

Laurent Pinchart
