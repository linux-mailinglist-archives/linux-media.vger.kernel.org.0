Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD25D7AD036
	for <lists+linux-media@lfdr.de>; Mon, 25 Sep 2023 08:35:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231787AbjIYGfP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Sep 2023 02:35:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229925AbjIYGfO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Sep 2023 02:35:14 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4A19A2
        for <linux-media@vger.kernel.org>; Sun, 24 Sep 2023 23:35:08 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50A44C433C8;
        Mon, 25 Sep 2023 06:35:07 +0000 (UTC)
Message-ID: <ac9dec4a-54d0-433f-869a-2e7a522a83a6@xs4all.nl>
Date:   Mon, 25 Sep 2023 08:35:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/14] MAINTAINERS: Add co-maintainer for the rkisp1
 driver
Content-Language: en-US, nl
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna@fastmail.com>,
        Paul Elder <paul.elder@ideasonboard.com>,
        linux-rockchip@lists.infradead.org
References: <20230925004112.22797-1-laurent.pinchart@ideasonboard.com>
 <20230925004112.22797-2-laurent.pinchart@ideasonboard.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230925004112.22797-2-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 25/09/2023 02:40, Laurent Pinchart wrote:
> As I'm actively working on the rkisp1 driver, I would like to volunteer
> as a co-maintainer, mostly to make sure I get CC on patches.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index bf0f54c24f81..9ce0d128410c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18512,6 +18512,7 @@ F:	sound/soc/rockchip/rockchip_i2s_tdm.*
>  
>  ROCKCHIP ISP V1 DRIVER
>  M:	Dafna Hirschfeld <dafna@fastmail.com>
> +M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>  L:	linux-media@vger.kernel.org
>  L:	linux-rockchip@lists.infradead.org
>  S:	Maintained

Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Regards,

	Hans
