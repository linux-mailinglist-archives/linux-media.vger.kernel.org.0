Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 228768A092
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2019 16:19:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727218AbfHLOTa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Aug 2019 10:19:30 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:34713 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726325AbfHLOTa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Aug 2019 10:19:30 -0400
Received: by mail-ot1-f66.google.com with SMTP id n5so159392323otk.1
        for <linux-media@vger.kernel.org>; Mon, 12 Aug 2019 07:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=IYKcaAxSUXSLWlSHYCezPjjjdoMELWaMbCrjl2NmRfY=;
        b=Pt7fCr91W6DvDkWtDDrseUuFrBpRTivsHBGGm945oUNY3jvMDupYAaBs/A6/imyoNX
         VHp5rbs2Q+y01R+frFrsKy7svjhhQSU3cUwrpBwMowOVoDjtS4wqSYSqxzLmnaXX1fyA
         1+H2C/x3LF5CFPjjEOefGHy/H+loF1NQJS28Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IYKcaAxSUXSLWlSHYCezPjjjdoMELWaMbCrjl2NmRfY=;
        b=Ig7kyOtF6Ddl2g7TcIkHNed5NGzybnFX6lhvYfMkTMzQckCPNpaIjRSDDVI/rjkn4F
         3J4y4lAGlJtAfGp1UFfmAfsQGxN+WrLWElBICsoIQhbAtZbgYCpRpXAUtQesrLRZLMCe
         rxFDlBzkjSSVaaZX2izZSaYgPm9XMO6mv82KH8izeIIijTIIcULPmfQb0zWzuwFo01N3
         ENgNb29Bg5W3pmdkvXllHv+r+RqRq7Oby6f/v2cxhTC/MSjRJQz++Z3aK6H7miceJtIR
         AosV/x21vwrfYgjHzglfznS3Ec2OqmRsAmBLLxJN8KJ0paYUaE/CzvUCDQQJ0O4guPc+
         P+dw==
X-Gm-Message-State: APjAAAWViwWQfjGMdmEfiMJ3Z5vkePW93NOzBJt4PYQfpMQYWtKnKfda
        CHP9lKwh9Iii5F28/qFm56pvEwA/2qs=
X-Google-Smtp-Source: APXvYqwRoQCDCl9xIntsgU9V7rgFqpBRfFWdjGKdxXbtNChGf1uUzb4+He0XY+3ELPWgT+eGxZmReg==
X-Received: by 2002:a5d:93cd:: with SMTP id j13mr14863113ioo.39.1565619568913;
        Mon, 12 Aug 2019 07:19:28 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id w5sm20166879iom.33.2019.08.12.07.19.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 12 Aug 2019 07:19:28 -0700 (PDT)
Subject: Re: [PATCH 1/3] media: vimc: move private defines to a common header
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        helen.koike@collabora.com,
        =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@collabora.com>
Cc:     mchehab@kernel.org, hverkuil@xs4all.nl,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <cover.1565386363.git.skhan@linuxfoundation.org>
 <142cc5a6a10f75ed97de8b2d9b1e73b034a88b2f.1565386363.git.skhan@linuxfoundation.org>
 <20190810141432.GA30451@pendragon.ideasonboard.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <ab0b316c-8b6d-0faf-b046-97c8065b8afd@linuxfoundation.org>
Date:   Mon, 12 Aug 2019 08:19:27 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190810141432.GA30451@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On 8/10/19 8:14 AM, Laurent Pinchart wrote:
> Hi Shuah,
> 
> Thank you for the patch.
> 
> On Fri, Aug 09, 2019 at 03:45:41PM -0600, Shuah Khan wrote:
>> In preparation for collapsing the component driver structure into
>> a monolith, move private device structure defines to a new common
>> header file.
> 
> Apart from the vimc_device structure, this doesn't seem to be needed.
> I'd rather keep each structure private to the .c file that handles it,
> and only share vimc_device globally.
> 

Right. I initially thought that I needed these global. Once I completed
the patches without needing these as global, I overlooked updating the
patches.

I will take care of that. Any thoughts on vimc.h vs. adding vimc_device
struct to existing vimc-common.h

As I explained to Helen in response to her comment about:

"My thinking is that vimc-common.h is common for all the subdevs and
putting vimc-core defines and structures it shares it with the subdev
files can be in a separate file.

It is more of design choice to keep structures and defined organized.
Originally I was thinking all the subdev device structires need to be
global, and my patch set I sent out as such doesn't need that. I just
overlooked that when I sent the patches out.

This reduces the number of things that need to be common, I don't really
have any strong reasons for either choice of adding common defines to
vimc-common.h vs vimc.h - maybe with a slight tilt towards vimc.h"

Thanks all for a quick review and testing. I will work on v2 with your
comments. I want to make sure topology either looks the same as what
is in media master. I think it is, but I want to double check.

thanks,
-- Shuah
