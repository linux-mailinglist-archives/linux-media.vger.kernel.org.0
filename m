Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3327369802F
	for <lists+linux-media@lfdr.de>; Wed, 15 Feb 2023 17:09:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229646AbjBOQJh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Feb 2023 11:09:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbjBOQJg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Feb 2023 11:09:36 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCC703A095
        for <linux-media@vger.kernel.org>; Wed, 15 Feb 2023 08:09:35 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CA88010B;
        Wed, 15 Feb 2023 17:09:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676477374;
        bh=Ug5tLFHntIfuGWKd0+staRzrQfwWQy9n96E79gWePlY=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=wMuXXTXHWtcHXnZsn/FcKZC2/Vm1VoGPG8J87v3bGIwL07OUJGKGToiPQ80Hpoud9
         yFIFSLnJVQooCPLBGDdOFDstxepgOzyyqZj9TPqwdJ5byM+dZJLWxKi7DXJWojBIs/
         lrcnn8cGwjdHaKbxNuQATNg0th48I/OsCocjQ0ag=
Message-ID: <3ce6face-e076-6913-536c-6ca24c18044f@ideasonboard.com>
Date:   Wed, 15 Feb 2023 18:09:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] media: Fix indentation issues introduced by subdev-wide
 state struct
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Eugen Hristev <eugen.hristev@collabora.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
References: <20230215160550.5108-1-laurent.pinchart@ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20230215160550.5108-1-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 15/02/2023 18:05, Laurent Pinchart wrote:
> Commit 0d346d2a6f54 ("media: v4l2-subdev: add subdev-wide state struct")
> applied a large media tree-wide change produced by coccinelle. It was so
> large that a set of identical indentation issues went unnoticed during
> review. Fix them.
> 
> While at it, and because it's easy to review both changes together, add
> a trailing comma for the last (and only) struct member initialization of
> the related structures, to avoid future changes should new fields need
> to be initialized.
> 
> Fixes: 0d346d2a6f54 ("media: v4l2-subdev: add subdev-wide state struct")
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>   drivers/media/pci/saa7134/saa7134-empress.c        |  4 ++--
>   drivers/media/platform/atmel/atmel-isi.c           |  4 ++--
>   drivers/media/platform/intel/pxa_camera.c          |  4 ++--
>   drivers/media/platform/marvell/mcam-core.c         |  4 ++--
>   drivers/media/platform/renesas/renesas-ceu.c       |  4 ++--
>   .../platform/rockchip/rkisp1/rkisp1-resizer.c      | 14 +++++++-------
>   drivers/media/platform/via/via-camera.c            |  4 ++--
>   drivers/staging/media/atomisp/pci/atomisp_cmd.c    |  8 ++++----
>   .../media/deprecated/atmel/atmel-isc-base.c        |  4 ++--
>   9 files changed, 25 insertions(+), 25 deletions(-)
> 

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi

