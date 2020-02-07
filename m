Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FF0E155728
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2020 12:50:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727011AbgBGLu5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Feb 2020 06:50:57 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:52338 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726819AbgBGLu5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Feb 2020 06:50:57 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: andrzej.p)
        with ESMTPSA id 56AC729482C
Subject: Re: [PATCH 0/4] Hantro VPU JPEG encoder fixes
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        devel@driverdev.osuosl.org
Cc:     linux-media@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        kernel@collabora.com, Tomasz Figa <tfiga@chromium.org>
References: <20200127143009.15677-1-andrzej.p@collabora.com>
 <1d83a74c24269c7bcf6d6d8a789c88dbf7370dbb.camel@collabora.com>
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Message-ID: <8a526fdb-cbfb-fe75-e24f-83f7c09a13a5@collabora.com>
Date:   Fri, 7 Feb 2020 12:50:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1d83a74c24269c7bcf6d6d8a789c88dbf7370dbb.camel@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi All,

<snip>

> I've just tested RK3288, and this series is indeed fixing
> these issues. So for all patches:
> 
> Tested-by: Ezequiel Garcia <ezequiel@collabora.com>

A kind reminder.

The series fixes serious encoding quality problems in both rk3399 and rk3288,
so it seems it should be included. A review is needed, though, at least for
patches 2-4.

Thank you,

Andrzej
