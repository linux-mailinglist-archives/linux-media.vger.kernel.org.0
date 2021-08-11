Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E999F3E94F4
	for <lists+linux-media@lfdr.de>; Wed, 11 Aug 2021 17:47:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233303AbhHKPrw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Aug 2021 11:47:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233276AbhHKPrK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Aug 2021 11:47:10 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE4E7C061765
        for <linux-media@vger.kernel.org>; Wed, 11 Aug 2021 08:46:42 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id BC7FE1F43330
Message-ID: <123eee90ee3e3fe5227f6ed88defc3818645c83e.camel@collabora.com>
Subject: Re: [RFC PATCHv2 02/11] v4l2-ctrls: add support for dynamically
 allocated arrays.
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Daniel Almeida <daniel.almeida@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        John Cox <jc@kynesim.co.uk>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Date:   Wed, 11 Aug 2021 12:46:33 -0300
In-Reply-To: <ccaf0fa9-8be6-c623-61c7-91cb804ca2bf@collabora.com>
References: <20210610113615.785359-1-hverkuil-cisco@xs4all.nl>
         <20210610113615.785359-3-hverkuil-cisco@xs4all.nl>
         <ccaf0fa9-8be6-c623-61c7-91cb804ca2bf@collabora.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


[..]

> 
> 
>  I tested & used this on my AV1 uapi patches [0] and this feature works just fine as far as I can tell.
>  
>  Tested-By: Daniel Almeida <daniel.almeida@collabora.com>
>  
>  Can this please be queued for 5.15?
>  

Hi Daniel,

I believe your reply wasn't plain text so might have been filtered.

Also, I'd say we want to have users actually using the interface,
before we consider merging it.
-- 
Kindly,
Ezequiel

