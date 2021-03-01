Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CB43327EA2
	for <lists+linux-media@lfdr.de>; Mon,  1 Mar 2021 13:53:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235196AbhCAMwt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Mar 2021 07:52:49 -0500
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:35373 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233003AbhCAMws (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 1 Mar 2021 07:52:48 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id Gi1qlDbVJC40pGi1tli6iR; Mon, 01 Mar 2021 13:52:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1614603126; bh=eOJKOi6UV6TKTPs61e6Eh33EfqCXUit6E11f0iLK+wg=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=J3SjGafSwrhLO9gR/83FoySqtkQt02bY77QwubSCfCqSuQAkj6lBME/LMdBGtrnY+
         1Anis4Y4xHvJLSwRYix1RJT84zAXQkhX/Tfc2IIoEkmhXWZAG0g0eD4C8rOjF0e/nD
         pJX5iMLDHCVORGTBNiSjejpYZsf7V+gpA8aACW9M7JII1PgWotnF1fqySL31MymYgG
         PKiyFkPqGftIkpw0khFTY2sNkse4tQLqYDOhmKpGEVBXGPAOfTLMYLdEcbipAs6T2D
         dEVY0rBK+G6ayQIRXf+Gc06BcwKFzVdbmKyJWOv14tPHGAVvv5FCjyY/yWDb5kAd+2
         XfyweDOrrC2cw==
Subject: Re: [PATCH v3] media: add a subsystem profile documentation
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        linuxarm@huawei.com, mauro.chehab@huawei.com,
        Jonathan Corbet <corbet@lwn.net>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <bbe8dc3119b21317616535b7062811968a89b85e.1614591312.git.mchehab+huawei@kernel.org>
 <20210301103133.GK3@valkosipuli.retiisi.eu>
 <20210301134252.3d165cce@coco.lan>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <465e00ff-835e-2455-8225-d779583de726@xs4all.nl>
Date:   Mon, 1 Mar 2021 13:52:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210301134252.3d165cce@coco.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfD1xMiNy0W66Latj6SFuZzNTMvC3mhskT7Oa0wIf18qoYbyoUajhfVc6DFRHVJqK1dyx1TD5zE0oNjg2nFtKXlq2tgl+UZS6tdUsnUPxCuujgck2rnkJ
 YwPuho6UISHMTD9Ue+o1zaKa1Whlbk5hhyBpwVHRF3seUuCq10iZ75pQ/LvWlylqENPgittUEX9Z017gW64onExmZri1y6VPtn88crQd7LyRw3mPjQEc8uiZ
 MiOvCufB8V9ttOxgbfmd6uNOtK04gAk1unR9kDL+mCmDD9L2H3cAD5fcD8P1vw0zVHN9pd4ibKXZUMYFmDS7/Qacr4dh8tx4/j29n5XI8j6zevoOVvQ8F2lo
 NgApEISyXJvWnJ5k2JVqLl2sGzM2078QDUfUJfB0v5FECeQAUwGXFd3aGX9v5Mrvb+u5wQS5RkPUv1764veDlXkNHFFr8PdCsVLjCi7fvvvUJSosASL0RIpz
 KJFcd5f4ZaHbrzJZlDhotnIfs1pI2EVdT0n5t09B/tUotUMWFb9ZyQI3RkSD2V6JagvPdiz4+unqIUKd
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 01/03/2021 13:42, Mauro Carvalho Chehab wrote:
> Em Mon, 1 Mar 2021 12:31:34 +0200
> Sakari Ailus <sakari.ailus@iki.fi> escreveu:
> 
>>> +Sensor drivers:
>>> +  Sakari Ailus <sakari.ailus@linux.intel.com>  
>>
>> Could you add me:
>>
>> v4l2-async, v4l2-fwnode, v4l2-flash-led-class.
> 
> Adding in v5:
> 
> 	v4l2-async, v4l2-fwnode, v4l2-flash-led-class and Sensor drivers:
> 	  Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> 
>>
>> ISP drivers are generally complicated; I wonder if it should be me, Laurent
>> and Hans. It'd be nice to add ISPs, too.
> 
> Not sure how to add ISP. I mean, we're actually splitting the drivers
> per API usage. Probably the main part of mapping an ISP into V4L would
> be as codec drivers, but other drivers could be doing something else.

Not sure what you mean with "as codec drivers".

ISP drivers tend to need reviews of multiple sub-maintainers, each with a
focus on their own expert area. Probably Laurent and Sakari are the primary
reviewers, while I focus more on e.g. the control framework and vb2 usage.

Regards,

	Hans

> 
> Suggestions?
> 
> 
>>
> 
>> If the order is reversed, that could be expressed fairly neatly.
> 
> 
> Thanks,
> Mauro
> 

