Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F554B39DE
	for <lists+linux-media@lfdr.de>; Mon, 16 Sep 2019 14:00:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731441AbfIPMA4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Sep 2019 08:00:56 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:58493 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731514AbfIPMA4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Sep 2019 08:00:56 -0400
Received: from [IPv6:2001:983:e9a7:1:3124:3fc9:5634:2d8] ([IPv6:2001:983:e9a7:1:3124:3fc9:5634:2d8])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 9pgbioyTlV17O9pgciDj4J; Mon, 16 Sep 2019 14:00:54 +0200
Subject: Re: [PATCHv2 0/2] Add helper functions to print a fourcc
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     linux-media@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.org>
References: <20190916100433.24367-1-hverkuil-cisco@xs4all.nl>
 <20190916115207.GO843@valkosipuli.retiisi.org.uk>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <2c0da850-7073-0fc6-7246-9e530a54cf26@xs4all.nl>
Date:   Mon, 16 Sep 2019 14:00:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190916115207.GO843@valkosipuli.retiisi.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfLYIk9goZZCRRohCrZqJN5tCVAVNB5lmZnIso5rO3/mAgvjIsHAAsfdw8F7Js41nniaUhp5tP15OdJoplFeXqAg0ZyCvybpZwareKEjy/mcr93wshWxQ
 Xua4eaKlAd98JZXQI0pS/CyE6LFTTmCpjxfLKzsF8mkqRw+Gkpf20W7dk5lQuB9TXQdazv+hvkKJda341rEKKx+i6OJoc635v17ibT+SjUKJ7MOPV8LSPk6q
 koSyFRrfrV6+LILgO9x49eG0INQLSlCkvpZWJaa/gofQ/sPFOxekKeLraRxs5S4y0kSF4pSQBcN+5iBqw028xtcD3AS/OZK/1ompgg4cPr7+fYmS3DpmVDGd
 gWYTA+xg
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/16/19 1:52 PM, Sakari Ailus wrote:
> On Mon, Sep 16, 2019 at 12:04:31PM +0200, Hans Verkuil wrote:
>> It turns out that Sakari posted a newer patch in 2018. I used that
>> for this v2: https://patchwork.linuxtv.org/patch/48372/
>>
>> Mauro commented on that original patch that there was no need to
>> have this available for userspace.
>>
>> I disagree: why wouldn't userspace want to report pixelformats?
>>
>> It happens in several places in v4l-utils, and there the pixelformats are
>> printed in different ways as well. Providing a standard way of reporting
>> a V4L2 fourcc is very useful.
> 
> Thanks, Hans!
> 
> Can you take these to your tree (perhaps pending some sort of agreement
> with Mauro)?
> 

Certainly.

	Hans
