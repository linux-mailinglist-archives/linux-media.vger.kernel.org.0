Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF53272FF7
	for <lists+linux-media@lfdr.de>; Wed, 24 Jul 2019 15:33:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726962AbfGXNdv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jul 2019 09:33:51 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:47537 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725882AbfGXNdv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jul 2019 09:33:51 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud9.xs4all.net with ESMTPA
        id qHOshIMVV0QvJqHOvh9XWQ; Wed, 24 Jul 2019 15:33:49 +0200
Subject: Re: tw686x driver (continued)
To:     =?UTF-8?Q?Mark_Balan=c3=a7ian?= <mbalant3@gmail.com>
Cc:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        linux-media@vger.kernel.org
References: <84ab52c4-9ea7-c526-c628-47d678ccf926@gmail.com>
 <CAAEAJfDgEVMWbYkEaVp0mp4hQXbhZq8xJQM8xqCXGmyq7OaP9w@mail.gmail.com>
 <2586e6ca-da28-ac87-35dc-dfa6ae66f67d@gmail.com>
 <35ebabef-46cc-f4d0-3e88-3d8f4243c685@gmail.com>
 <bd66b641-d11a-7794-ebe2-c7c4bbbc5208@xs4all.nl>
 <4C82E321-DCA7-4627-880D-0CFD6FB74972@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <da992b73-8997-ba22-14fc-32dd790772eb@xs4all.nl>
Date:   Wed, 24 Jul 2019 15:33:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <4C82E321-DCA7-4627-880D-0CFD6FB74972@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfAHrzp6S/bk80YdSv188Cx9XLDnDSOfKfC765+zjf8z1Z5rhvbp+UyRkZb4Ko7yjB7clIp4C383N0O16PsOqboXNoUmQdhCgxzzbNqYHKQhmmtKbr/qc
 W0EemRgJk8unE7rJu2tdU2cS2inIPzjqQk9DNdMIWRjiCdBAPg+L8F4Aruh3r2CnUyHvwkHQGS5lQGuSxbARI2EG1btqmXYlNUamJCvMpjnCY9pch2C2OvsN
 NN4YXPCubrMVtucMrQx/pg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 7/24/19 3:31 PM, Mark Balançian wrote:
> On Jul 24, 2019, at 6:08 AM, Hans Verkuil <hverkuil@xs4all.nl <mailto:hverkuil@xs4all.nl>> wrote:
>>
>> What tw686x_video_free() does really should be done in the release function
>> of the video_device: vdev->release is currently set to video_device_release,
>> but that should be a custom function that calls dev->dma_ops->free.
> 
> Hello all,
> 
> There just appears some possible race condition as detected by the tool my supervisor has given me access to. I have to write a patch for
> the linux kernel as an assignment. By the above, does this mean I may please write the custom function that calls dev->dma_ops->free to
> replace the vdev->release = video_device_release line?

Certainly. That's definitely a sensible change.

Regards,

	Hans
