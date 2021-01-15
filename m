Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22DF52F789B
	for <lists+linux-media@lfdr.de>; Fri, 15 Jan 2021 13:19:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727112AbhAOMT1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jan 2021 07:19:27 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:32894 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726381AbhAOMT1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jan 2021 07:19:27 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 4D0201F45ECD
Message-ID: <17998f3e2af82598f0b47015cb959bc3518682b5.camel@collabora.com>
Subject: Re: [PATCH v3 1/2] media: rockchip: rkisp1: carry ip version
 information
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Heiko Stuebner <heiko@sntech.de>, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, linux-media@vger.kernel.org,
        mchehab@kernel.org, Laurent.pinchart@ideasonboard.com,
        hverkuil@xs4all.nl
Cc:     linux-rockchip@lists.infradead.org,
        christoph.muellner@theobroma-systems.com, tfiga@chromium.org,
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
Date:   Fri, 15 Jan 2021 09:18:36 -0300
In-Reply-To: <20210115112351.208011-2-heiko@sntech.de>
References: <20210115112351.208011-1-heiko@sntech.de>
         <20210115112351.208011-2-heiko@sntech.de>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Heiko,

Thanks a lot for pushing this.

On Fri, 2021-01-15 at 12:23 +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> 
> The IP block evolved from its rk3288/rk3399 base and the vendor
> designates them with a numerical version. rk3399 for example
> is designated V10 probably meaning V1.0.
> 
> There doesn't seem to be an actual version register we could read that
> information from, so allow the match_data to carry that information
> for future differentiation.
> 
> Also carry that information in the hw_revision field of the media-
> controller API, so that userspace also has access to that.
> 
> The added versions are:
> - V10: at least rk3288 + rk3399
> - V11: seemingly unused as of now, but probably appeared in some soc
> - V12: at least rk3326 + px30
> - V13: at least rk1808
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>

Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>

Regards,
Ezequiel

