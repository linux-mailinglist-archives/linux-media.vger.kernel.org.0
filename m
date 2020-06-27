Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19A7A20C02C
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2020 10:29:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726444AbgF0I2j (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 27 Jun 2020 04:28:39 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:55827 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726404AbgF0I2i (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 27 Jun 2020 04:28:38 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id p6CNjiPG4xmkVp6CQjl6zN; Sat, 27 Jun 2020 10:28:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1593246516; bh=9dCkr8q438k8a7OtUe9GHrF8GoB3+P1Sq6GHRgD7MMo=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Ga4etwEjjiKjj4nIxTE1CvhQoVlaFwKxNCgSY6sfpcsZqEg6oiAcX9F1hc+lwW++U
         V0kIs/HxfCz1VN1NgmEDyPBofpaGADSKhaHNUoMd1PD6wyf+3JGQzq5y/oM7vmsflj
         7tYJPNoA23X85YXZI9ThqqXtiFBFK5prRYsJsILnRr1lpfYVFw5FpKu1yCm7BxyWWZ
         19AQP6iXvlOVWcVotor1SripoZ0cp4kDqjKIaBvxZmc3euhTsyc8Q1ap3oguA8j68/
         xedaWGveGcfJnMOtxuynQamYa94SA+p28rI50UPRuI2hFtRgF3BkJKW3uJ80QsQx4/
         7ggGu0Vm5mQ9Q==
Subject: Re: [PATCH] staging: media: usbvision: removing prohibited space
 before ',' (ctx:WxW)
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        B K KARTHIK PES2201800185STUDENT ECE DeptPESU EC
         Campus <bkkarthik@pesu.pes.edu>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
References: <20200626143205.xns6nwggskssujao@pesu-pes-edu>
 <CAAhDqq0tSftPxMWGeVy3mp4DGDN3o0uQwTqVbjYUwjqzWpbibQ@mail.gmail.com>
 <20200627050745.GD226238@kroah.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <f73c5a69-1bf9-d80d-2399-ef18ce78b8ac@xs4all.nl>
Date:   Sat, 27 Jun 2020 10:28:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200627050745.GD226238@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfP9bgrYsjbNib59VOH2MNZMoeUze+VQAk3Xl6GQlkUNZRlsnHFWYe79nxsesg/Ysz9pF6xPWzoV1Mc3eMQlijsfTLWZEPQegM/l0N+JNTfOc98eveA4D
 dsYguGkiA+mPxJtKclNksyR7PAPEIwsp4T9dzMQy9uoo8YIDol91L3ZqrxkzidfK7rSVGduunsbMJRBXmk0cvwVEAVjtSdGDjemNfKLlWnlDE259Y7tYyoSt
 opCEXH+wrnKCSGFob0XxANQ+1m16grx8ee/JaEZU05CCLCQpjEuL2CKQVeAnAgjyUaL/aevg+PncqZbSgTPCCObtq/D96ilmKEBe61pz5gIKsDhwjP9x4s1z
 diM9QE5e
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 27/06/2020 07:07, Greg Kroah-Hartman wrote:
> 
> A: http://en.wikipedia.org/wiki/Top_post
> Q: Were do I find info about this thing called top-posting?
> A: Because it messes up the order in which people normally read text.
> Q: Why is top-posting such a bad thing?
> A: Top-posting.
> Q: What is the most annoying thing in e-mail?
> 
> A: No.
> Q: Should I include quotations after my reply?
> 
> http://daringfireball.net/2007/07/on_top
> 
> On Fri, Jun 26, 2020 at 11:42:49AM -0400, B K KARTHIK PES2201800185STUDENT ECE DeptPESU EC Campus wrote:
>> Oh, I'm sorry but wouldn't it be helpful if we had a file that lists
>> all drivers that are scheduled for removal?
> 
> The TODO file in the directory for the driver should have this
> information in it.  I don't know if all of the media drivers have this,
> if not, then there is no way you could have known this.

They have, and in addition the Kconfig entry will mention that the driver
is deprecated.

TODO of usbvision:

The driver is deprecated and scheduled for removal by the end
of 2020.

In order to prevent removal the following actions would have to
be taken:

- clean up the code
- convert to the vb2 framework
- fix the disconnect and free-on-last-user handling (i.e., add
  a release callback for struct v4l2_device and rework the code
  to use that correctly).

Regards,

	Hans
