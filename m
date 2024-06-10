Return-Path: <linux-media+bounces-12820-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1F6901DEB
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 11:16:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2B45DB25902
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 09:16:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B5E66BFA5;
	Mon, 10 Jun 2024 09:15:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2986118C31
	for <linux-media@vger.kernel.org>; Mon, 10 Jun 2024 09:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718010958; cv=none; b=KL4p28sFGKdi+U0vRb5NwDmdh9P8el0Dw23hsXzHFhrxGuHspGKBFzZ9qRLsGOuYaxWtuhGzebIDEqcQ4rZtskrin3sDPfZOPropuFJKJ5H30BuAG+CkNWhkB4RF333R66LMoPiHeCcEh2W4F+4sfDtBqpaDoOz44MJEsmQBn6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718010958; c=relaxed/simple;
	bh=FqbBAHaqDFIRxgaVJ57FdBxG0ORDPBd8Kt90cSNi+F0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e/aIK84GGzQ5QozJMFNagDCft1X/YUold53x5uu+KDY1ZekAVR84J6nKRrh31LAkkI97cloWiMwU5tJTTJ+s/c8UI2TmjoazhNGDpG4aKwPAT2reQErJlklm92Rnua6Z0UBrvx6Q/NoJ68Q3OPIE5yPUzT8kZistUcQ4ahrxl/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C529DC4AF4D;
	Mon, 10 Jun 2024 09:15:56 +0000 (UTC)
Message-ID: <3dbe8c9f-ed9a-4d4b-8a69-d16c8223efdd@xs4all.nl>
Date: Mon, 10 Jun 2024 11:15:55 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v4l-utils] [PATCH v1 3/3] utils: media-ctl: Support accessing
 the subdev TRY state
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>
References: <20240610012238.30462-1-laurent.pinchart@ideasonboard.com>
 <20240610012238.30462-4-laurent.pinchart@ideasonboard.com>
 <fc1ff8b7-5404-44f3-acf5-9ee2e7b43c4d@ideasonboard.com>
 <20240610090028.GL18479@pendragon.ideasonboard.com>
 <fecb0e39-fc08-44b8-a42e-f179faa57b93@xs4all.nl>
 <20240610091131.GN18479@pendragon.ideasonboard.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20240610091131.GN18479@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/06/2024 11:11, Laurent Pinchart wrote:
> Hi Hans,
> 
> On Mon, Jun 10, 2024 at 11:06:30AM +0200, Hans Verkuil wrote:
>> On 10/06/2024 11:00, Laurent Pinchart wrote:
>>> On Mon, Jun 10, 2024 at 09:14:59AM +0300, Tomi Valkeinen wrote:
>>>> On 10/06/2024 04:22, Laurent Pinchart wrote:
>>>>> Add a -W/--which argument to media-ctl to select which state to operate
>>>>> on. Default to the ACTIVE state to preserve the current behaviour.
>>>>>
>>>>> Despite the fact that all values set on the TRY state are lost when
>>>>> media-ctl terminates, support for the TRY state is useful in order to
>>>>> retrieve the default configuration of subdevs, or to try configurations.
>>>>
>>>> I think this is fine, but I'm curious why you chose such an argument. I 
>>>> would have thought "-t/--try" (or even just --try) would have been 
>>>> simpler to implement and to use. I think I would remember "--try" 
>>>> easily, but "-W TRY", I fear I'll have to check the man page every time...
>>>
>>> There are a few reasons:
>>>
>>> - Be closer to the API (media-ctl is a low-level tool)
>>> - Support other values later if the kernel API evolves (no plan for
>>>   that, but who knows ?)
>>> - I find it easier to propagate arguments in scripts this way. If a
>>>   script that wraps media-ctl receives a nothing/--try argument, it's
>>>   fairly easy to translate that to nothing/-W TRY. If it receives a
>>>   --foo ACTIVE/TRY argument (on the command line, in an interactive
>>>   prompt, as part of a string that tells what to do on a pad, ...), then
>>>   translating that to '-W arg' is easier than to nothing/-W TRY.
>>>
>>>>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>>>> ---
>>>>>   utils/media-ctl/media-ctl.c | 13 +++++++------
>>>>>   utils/media-ctl/options.c   | 18 +++++++++++++++++-
>>>>>   utils/media-ctl/options.h   |  1 +
>>>>>   3 files changed, 25 insertions(+), 7 deletions(-)
>>>>>
>>>>> diff --git a/utils/media-ctl/media-ctl.c b/utils/media-ctl/media-ctl.c
>>>>> index 42b1bd9aaa6e..33df0880fd9b 100644
>>>>> --- a/utils/media-ctl/media-ctl.c
>>>>> +++ b/utils/media-ctl/media-ctl.c
>>>>> @@ -600,7 +600,6 @@ static void media_print_topology_text(struct media_device *media,
>>>>>   
>>>>>   int main(int argc, char **argv)
>>>>>   {
>>>>> -	const enum v4l2_subdev_format_whence which = V4L2_SUBDEV_FORMAT_ACTIVE;
>>>>>   	struct media_device *media;
>>>>>   	struct media_entity *entity = NULL;
>>>>>   	int ret = -1;
>>>>> @@ -667,7 +666,8 @@ int main(int argc, char **argv)
>>>>>   			goto out;
>>>>>   		}
>>>>>   
>>>>> -		v4l2_subdev_print_format(pad->entity, pad->index, stream, which);
>>>>> +		v4l2_subdev_print_format(pad->entity, pad->index, stream,
>>>>> +					 media_opts.which);
>>>>>   	}
>>>>>   
>>>>>   	if (media_opts.get_dv_pad) {
>>>>> @@ -709,9 +709,10 @@ int main(int argc, char **argv)
>>>>>   		media_print_topology_dot(media);
>>>>>   	} else if (media_opts.print) {
>>>>>   		if (entity)
>>>>> -			media_print_topology_text_entity(media, entity, which);
>>>>> +			media_print_topology_text_entity(media, entity,
>>>>> +							 media_opts.which);
>>>>>   		else
>>>>> -			media_print_topology_text(media, which);
>>>>> +			media_print_topology_text(media, media_opts.which);
>>>>>   	} else if (entity) {
>>>>>   		const char *devname;
>>>>>   
>>>>> @@ -741,7 +742,7 @@ int main(int argc, char **argv)
>>>>>   	}
>>>>>   
>>>>>   	if (media_opts.routes) {
>>>>> -		ret = v4l2_subdev_parse_setup_routes(media, which,
>>>>> +		ret = v4l2_subdev_parse_setup_routes(media, media_opts.which,
>>>>>   						     media_opts.routes);
>>>>>   		if (ret) {
>>>>>   			printf("Unable to setup routes: %s (%d)\n",
>>>>> @@ -751,7 +752,7 @@ int main(int argc, char **argv)
>>>>>   	}
>>>>>   
>>>>>   	if (media_opts.formats) {
>>>>> -		ret = v4l2_subdev_parse_setup_formats(media, which,
>>>>> +		ret = v4l2_subdev_parse_setup_formats(media, media_opts.which,
>>>>>   						      media_opts.formats);
>>>>>   		if (ret) {
>>>>>   			printf("Unable to setup formats: %s (%d)\n",
>>>>> diff --git a/utils/media-ctl/options.c b/utils/media-ctl/options.c
>>>>> index 3c408a1b9b06..3606525c33da 100644
>>>>> --- a/utils/media-ctl/options.c
>>>>> +++ b/utils/media-ctl/options.c
>>>>> @@ -40,6 +40,7 @@
>>>>>   
>>>>>   struct media_options media_opts = {
>>>>>   	.devname = MEDIA_DEVNAME_DEFAULT,
>>>>> +	.which = V4L2_SUBDEV_FORMAT_ACTIVE,
>>>>>   };
>>>>>   
>>>>>   static void print_version()
>>>>> @@ -75,6 +76,7 @@ static void usage(const char *argv0)
>>>>>   	printf("-r, --reset		Reset all links to inactive\n");
>>>>>   	printf("-v, --verbose		Be verbose\n");
>>>>>   	printf("    --version		Show version information\n");
>>>>> +	printf("-W, --which which	Select the subdev state to operate on\n");
>>>>>   	printf("\n");
>>>>>   	printf("Links and formats are defined as\n");
>>>>>   	printf("\tlinks           = link { ',' link } ;\n");
>>>>> @@ -140,6 +142,8 @@ static void usage(const char *argv0)
>>>>>   	for (i = V4L2_YCBCR_ENC_DEFAULT; i <= V4L2_YCBCR_ENC_SMPTE240M; i++)
>>>>>   		printf("\t                %s\n",
>>>>>   		       v4l2_subdev_ycbcr_encoding_to_string(i));
>>>>> +
>>>>> +	printf("\twhich           Subdev state ('ACTIVE' or 'TRY')\n");
>>>>>   }
>>>>>   
>>>>>   #define OPT_PRINT_DOT			256
>>>>> @@ -168,6 +172,7 @@ static struct option opts[] = {
>>>>>   	{"reset", 0, 0, 'r'},
>>>>>   	{"verbose", 0, 0, 'v'},
>>>>>   	{"version", 0, 0, OPT_VERSION},
>>>>> +	{"which", 1, 0, 'W'},
>>>>>   	{ },
>>>>>   };
>>>>>   
>>>>> @@ -244,7 +249,7 @@ int parse_cmdline(int argc, char **argv)
>>>>>   	}
>>>>>   
>>>>>   	/* parse options */
>>>>> -	while ((opt = getopt_long(argc, argv, "d:e:f:hil:prvV:R:",
>>>>> +	while ((opt = getopt_long(argc, argv, "d:e:f:hil:prvV:R:W:",
>>>>>   				  opts, NULL)) != -1) {
>>>>>   		switch (opt) {
>>>>>   		case 'd':
>>>>> @@ -294,6 +299,17 @@ int parse_cmdline(int argc, char **argv)
>>>>>   			media_opts.routes = optarg;
>>>>>   			break;
>>>>>   
>>>>> +		case 'W':
>>>>> +			if (!strcmp(optarg, "ACTIVE"))
>>>>> +				media_opts.which = V4L2_SUBDEV_FORMAT_ACTIVE;
>>>>> +			else if (!strcmp(optarg, "TRY"))
>>>>> +				media_opts.which = V4L2_SUBDEV_FORMAT_TRY;
>>
>> I very much prefer lower case here since it is a pain to type otherwise.
>> Alternatively, make this a case-insensitive string compare, that's fine as well.
> 
> I've tried to stick to the kernel API, the same way we use upper-case
> media bus codes. If it's generally preferred to use lower-case strings,
> or make the comparison case-insensitive, I can do that too. I generally
> dislike case-insensitivity though, it can easily lead to confusion.

Looking at 'media-ctl -h' it uses lower-case for pretty much everything,
including v4l2-field, v4l2-colorspace, etc. So if this is suddenly uppercase,
then that is inconsistent with the other options of this utility.

Note that I keep everything lowercase in v4l2-ctl/compliance as well.

Regards,

	Hans

> 
>>>>> +			else {
>>>>> +				printf("Invalid 'which' value '%s'\n", optarg);
>>>>> +				return 1;
>>>>> +			}
>>>>> +			break;
>>>>> +
>>>>>   		case OPT_PRINT_DOT:
>>>>>   			media_opts.print_dot = 1;
>>>>>   			break;
>>>>> diff --git a/utils/media-ctl/options.h b/utils/media-ctl/options.h
>>>>> index 753d09347585..095729b98014 100644
>>>>> --- a/utils/media-ctl/options.h
>>>>> +++ b/utils/media-ctl/options.h
>>>>> @@ -37,6 +37,7 @@ struct media_options
>>>>>   	const char *get_dv_pad;
>>>>>   	const char *dv_pad;
>>>>>   	const char *routes;
>>>>> +	enum v4l2_subdev_format_whence which;
>>>>>   };
>>>>>   
>>>>>   extern struct media_options media_opts;
> 


