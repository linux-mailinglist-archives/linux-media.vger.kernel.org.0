Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EC9F40867C
	for <lists+linux-media@lfdr.de>; Mon, 13 Sep 2021 10:28:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237811AbhIMIaA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Sep 2021 04:30:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234575AbhIMI37 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Sep 2021 04:29:59 -0400
Received: from lb2-smtp-cloud7.xs4all.net (lb2-smtp-cloud7.xs4all.net [IPv6:2001:888:0:108::2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA6E9C061574;
        Mon, 13 Sep 2021 01:28:43 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id PhKSmX09LpQdWPhKTm2149; Mon, 13 Sep 2021 10:28:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1631521722; bh=SmlXkz21F796HiS0hIs7UPuMWQV0q/28QQ/BSGKfs88=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=hCnV0ImDZNx6HyI3GiUjIjH9COV9b0GCHs96JvbgW1y57lepDj44aZVT61OiTw7JK
         KO1H+RZ713v+vGYpiqRduFWP5cPQk4GL0YO8YrxaoPShJ5lCZ5UfTExvAU1xMsd6B9
         4l/0jKqd4h7mCkImDfuCEOtgltGMhUpakNyoTJFhKT2ID+kxxYmqXBe0Wd/rjbpeWY
         lY25GiptrOzHO+1VFp1+Jq07U3MEpaiqDX9rvVrYvYZOE9yud8crlaIjKhItuugmRS
         yy3Ko+zXQoWZXpbE3ap3GKL6DTDs2RxYIMINIIj6crUfmfHfMtA9eKhZOXtDYpEmFC
         T25qOBYvuCkHg==
Subject: Re: [PATCH v7] media: vimc: Enable set resolution at the scaler src
 pad
To:     Pedro Terra <pedro@terraco.de>, dafna.hirschfeld@collabora.com,
        mchehab@kernel.org, skhan@linuxfoundation.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        gabrielabittencourt00@gmail.com, gfmandaji@gmail.com,
        laurent.pinchart@ideasonboard.com
References: <20210831174822.83870-1-pedro@terraco.de>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <8e7ff5a2-0629-228f-c9d5-35d39bf92ce2@xs4all.nl>
Date:   Mon, 13 Sep 2021 10:28:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210831174822.83870-1-pedro@terraco.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfKEJlOpp9rKLnhiR17qfIUdbnYLF/O1EQlrCIaQX7cndpSZve5lF8HIGaEu8jJN1eb51T1TBz3JfMVg3jUcHzdH8JkUiXy3AtiQSnyVZFgDyhB776fNN
 HAKf3oZtYJU+Dk8MWRHtBveW5a7ZgaDmlzwn/ypYrYmzikAOJj3r7YYntjU9jvNjQbfu4rObkQvSGoEi6KHcbfa2xN9OYGNNZEUGj7Hw3mUvd11zpaY5iEU/
 hAOiCLfswtcTV9V80k5slvWyO5RPI6+/CwanKzG/Wwlppehxd3UEK1Kf5r4LZQcepUQIFEjZCVqsCfG/tu73l/kQca7GBhRpC7ZoumG62qBOjoEX/dTYtGkq
 slOYlSNtoqO3xrq6LOu9Q+x0lXvfPRgcj757PwkTaEI0fJH9gcauT0j39rYYaJKIwKDcaTxZ7WfvZNc8HnHvidcCmlVMobixqOo8tCBexXsXk+NEyI0YDWAw
 LggARhnAtS1SB4gg9gd9yGyh79WnYSIzfhXeEnduaeiZ2QvNYlNUVI2anEw7NYMSDfIFxFKggIQGS+pLzWmZaCUpD/3wdktDGLnBvwzHCgI9+2Uni/xtkoq8
 j9rMQ4gfMtsxgRIU4IPyhpdZ
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Pedro,

Your 'From' email is Pedro Terra <pedro@terraco.de>, but...

On 31/08/2021 19:48, Pedro Terra wrote:
> Modify the scaler subdevice to accept setting the resolution of the source
> pad (previously the source resolution would always be 3 times the sink for
> both dimensions). Now any resolution can be set at src (even smaller ones)
> and the sink video will be scaled to match it.
> 
> Test example: With the vimc module up (using the default vimc topology)
> media-ctl -d platform:vimc -V '"Sensor A":0[fmt:SBGGR8_1X8/640x480]'
> media-ctl -d platform:vimc -V '"Debayer A":0[fmt:SBGGR8_1X8/640x480]'
> media-ctl -d platform:vimc -V '"Scaler":0[fmt:RGB888_1X24/640x480]'
> media-ctl -d platform:vimc -V '"Scaler":0[crop:(100,50)/400x150]'
> media-ctl -d platform:vimc -V '"Scaler":1[fmt:RGB888_1X24/300x700]'
> v4l2-ctl -z platform:vimc -d "RGB/YUV Capture" -v width=300,height=700
> v4l2-ctl -z platform:vimc -d "Raw Capture 0" -v pixelformat=BA81
> v4l2-ctl --stream-mmap --stream-count=10 -z platform:vimc -d "RGB/YUV Capture" \
> 	-stream-to=test.raw
> 
> The result will be a cropped stream that can be checked with the command
> ffplay -loglevel warning -v info -f rawvideo -pixel_format rgb24 \
> 	-video_size "300x700" test.raw
> 
> Co-developed-by: Gabriela Bittencourt <gabrielabittencourt00@gmail.com>
> Signed-off-by: Gabriela Bittencourt <gabrielabittencourt00@gmail.com>
> Co-developed-by: Gabriel Francisco Mandaji <gfmandaji@gmail.com>
> Signed-off-by: Gabriel Francisco Mandaji <gfmandaji@gmail.com>
> Signed-off-by: Pedro "pirate" Terra <pirate@terraco.de>

... that differs from what is used in this Signed-off-by.

checkpatch.pl complains about that.

Which of the two should I use? I can fix it myself in the pull request,
but I need to know which one I should use.

For future patches, please use consistent email addresses.

Regards,

	Hans
