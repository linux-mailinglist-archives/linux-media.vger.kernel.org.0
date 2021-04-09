Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6939035A3DD
	for <lists+linux-media@lfdr.de>; Fri,  9 Apr 2021 18:45:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233332AbhDIQpw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Apr 2021 12:45:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233038AbhDIQpw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Apr 2021 12:45:52 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E4EDC061760;
        Fri,  9 Apr 2021 09:45:39 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id D66C31F4677C
Message-ID: <09b7bddcba779ac1ed0c71cebf206f9bb4009f47.camel@collabora.com>
Subject: Re: [Outreachy kernel][PATCH 1/2 v3] staging: media: hantro: Align
 line break to the open parenthesis in file hantro_hw.h
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Date:   Fri, 09 Apr 2021 13:45:31 -0300
In-Reply-To: <03fb1d7b8066fd6fb6086fff18cf29b9afd9ac17.1617970550.git.alinesantanacordeiro@gmail.com>
References: <cover.1617970550.git.alinesantanacordeiro@gmail.com>
         <03fb1d7b8066fd6fb6086fff18cf29b9afd9ac17.1617970550.git.alinesantanacordeiro@gmail.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Aline,

On Fri, 2021-04-09 at 09:24 -0300, Aline Santana Cordeiro wrote:
> Aligns line break with the remaining function arguments
> to the open parenthesis. Issue found by checkpatch.
> 
> Signed-off-by: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
> ---
> Changes since v2:
>  - Rename the commit messages properly
> 
> Changes since v1:
>  - Send patchset without the cover-letter

Why did you remove the cover letter? What was wrong with it?

Thanks!
Ezequiel

