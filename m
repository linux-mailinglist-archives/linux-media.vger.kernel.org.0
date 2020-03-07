Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5EC4317CD6F
	for <lists+linux-media@lfdr.de>; Sat,  7 Mar 2020 11:05:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726072AbgCGKF3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 7 Mar 2020 05:05:29 -0500
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:56941 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725878AbgCGKF3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 7 Mar 2020 05:05:29 -0500
Received: from [IPv6:2001:983:e9a7:1:558f:c736:2117:17d1]
 ([IPv6:2001:983:e9a7:1:558f:c736:2117:17d1])
        by smtp-cloud9.xs4all.net with ESMTPA
        id AWKkjxAzG9Im2AWKljJ7pL; Sat, 07 Mar 2020 11:05:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1583575527; bh=B0qsu68aG/tdSntx9g5sDSKtz5L8WXRrm9hBewJbhkk=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=PMGy+NHpcYKflYY9E3bXRLPEtVlH24l4M4lXxcH8WB22XvZWbb9cPhxUfCmORCR6w
         EeV0/D8DJ0oS3jeSqcjx7VOik6C5NIFagxAfQCZ53XMRwqPEg0z6av9LEABGQT3/lJ
         9yJPFI+CMkarggx4pgM8GJ5iVIYcbwdsaSmwAhrRyGRBCgDZIFYDdg9ONfGRinevSV
         lZPJZQ1e59nNNCixuDsZwbL9cgxUx0nUM7uLDE5sZNAVKY/dchjalYt8zZG7kvhfld
         eIBVKbm8hJw25IAA6DRaXvlFWoqh4zA7ZV8olOM0iXZ/hDjdMp+W7vS80uxjVGFTwM
         k1DGC/J5qCGcw==
Subject: Re: [PATCHv4 05/11] videobuf2: handle V4L2_FLAG_MEMORY_NON_CONSISTENT
 flag
To:     Sergey Senozhatsky <senozhatsky@chromium.org>
Cc:     Hans Verkuil <hans.verkuil@cisco.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pawel Osciak <posciak@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200302041213.27662-1-senozhatsky@chromium.org>
 <20200302041213.27662-6-senozhatsky@chromium.org>
 <70144162-3bbe-4ea5-a3f7-e52d4585db53@xs4all.nl>
 <20200307075127.GD176460@google.com> <20200307093800.GA191261@google.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <d5ee2f4c-0e98-3b05-6109-4b3a4779f5b2@xs4all.nl>
Date:   Sat, 7 Mar 2020 11:05:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200307093800.GA191261@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfHF70vEjNioPSllU816EQkwFGG6oJo1HijwiLti4G/15arowBFe7f+oIo7w9x/arY3KjFNiRSYY2J7+nUioCIEFaeOCwluTS3k+7CEBGRBKh070lDNEu
 5dhaJR/Aq2Rp/+mX0+xiSUWCuQ8M6iBK2EFCB6KGwXMGpw7o/lcNPC7lH7j3Aw7/ZkHmIlJzFfwJA9+4I8GTJJ32XpvyzPbubZgDOtUUeY6uNDuVvBQV8aO4
 wlzkyu7Lzv42x6EoLh026Titwpy7aeZrIgmcYD1IFKJjR8vctAmvn3E2hH1KKYq05KeM/QTfz6PRCbEkiIkk9ph0VXNI6uLNtJirUqFbEy+/jX6AWJxAnt5L
 OWjfW+oM4fy169OibPvG/hthHdGYNGMImaW2OSFZVcDpC/C3f1iSio1cvXm3N0KipMpA33cHJIjW7B56gaqwrp+Cl35zfXnW2S6jXeIeDsJ2wp9VzcxOtcBa
 JmAlRNsdJOUDyz7AAwL/iIcfcK2Wg/dWXOa9zTxzWcJi3EBhkXTv/buKiWiyvnB55Sm+X8ZUimdGj4RNuO1ox/sbA/munZze7WsVH7DkVs37y54YWKblEn6V
 2S7/VV8GztpWbh0ed+iaO/HUKKK89JOJUMwsTKywfIfeoA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 07/03/2020 10:38, Sergey Senozhatsky wrote:
> On (20/03/07 16:51), Sergey Senozhatsky wrote:
>> On (20/03/06 16:30), Hans Verkuil wrote:
>> [..]
>>>>  
>>>>  /* capabilities for struct v4l2_requestbuffers and v4l2_create_buffers */
>>>> @@ -2446,7 +2449,8 @@ struct v4l2_create_buffers {
>>>>  	__u32			memory;
>>>>  	struct v4l2_format	format;
>>>>  	__u32			capabilities;
>>>> -	__u32			reserved[7];
>>>> +	__u32			flags;
>>>
>>> The new flags argument needs to be documented in the command for struct v4l2_create_buffers.
>>>
> 
> Hans, what does "command for struct v4l2_create_buffers" mean?

Oops: command -> comment

> 
> BTW, I added v4l2_create_buffers::flags comment:

Good, that's what I meant :-)

Regards,

	Hans

> 
> ---
> 
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 12b1bd220347..c6c1cccbb5c1 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -2441,6 +2441,8 @@ struct v4l2_dbg_chip_info {
>   * @memory:	enum v4l2_memory; buffer memory type
>   * @format:	frame format, for which buffers are requested
>   * @capabilities: capabilities of this buffer type.
> + * @flags:	additional buffer management attributes (ignored if queue
> + *		does not have V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS capability).
>   * @reserved:	future extensions
>   */
>  struct v4l2_create_buffers {
> 

