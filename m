Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5D4F3DA230
	for <lists+linux-media@lfdr.de>; Thu, 29 Jul 2021 13:32:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234461AbhG2Lcw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Jul 2021 07:32:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234161AbhG2Lcw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Jul 2021 07:32:52 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BC59C061765;
        Thu, 29 Jul 2021 04:32:46 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: gtucker)
        with ESMTPSA id 8FC731F43E41
Subject: Re: [PATCH] media: vivid: drop CONFIG_FB dependency
From:   Guillaume Tucker <guillaume.tucker@collabora.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com
References: <bf74a4670438864ca2e6bde47121554490350729.1627557341.git.guillaume.tucker@collabora.com>
Message-ID: <37aaf1b0-bb5a-a3df-054d-9aeea1f32a44@collabora.com>
Date:   Thu, 29 Jul 2021 12:32:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <bf74a4670438864ca2e6bde47121554490350729.1627557341.git.guillaume.tucker@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 29/07/2021 12:16, Guillaume Tucker wrote:
> +ifeq ($(CONFIG_FB),y)
> +  vivid-objs += vivid-osd.o
> +endif

Just realised CONFIG_FB is tristate, so I guess it should be:

ifneq ($(CONFIG_FB),)
  vivid-objs += vivid-osd.o
endif


Best wishes,
Guillaume
