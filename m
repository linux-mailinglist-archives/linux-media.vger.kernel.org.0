Return-Path: <linux-media+bounces-12817-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D270F901DC3
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 11:06:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B4FD81C22438
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 09:06:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D40976C76;
	Mon, 10 Jun 2024 09:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jiQJKCro"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376456F2E7
	for <linux-media@vger.kernel.org>; Mon, 10 Jun 2024 09:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718010188; cv=none; b=G7nDODB0VWXR8vRyjbJgzC0iir/JRlIfVKMWedzPVtQy7Moo+g4oEtnjfTvtHTkYJ4YXRvjl17tAriOuHOLM3i0AqZn0Iy0UFddzS4FWxj9E1+7PSE7iUd8br2nmdoXt+pF9R1Rj9uzH55C45YFujE5Sj2CcjySolLeaucn5TNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718010188; c=relaxed/simple;
	bh=bxWJXERRdoJzHbQqWjxH5WKbFDkVnAeUJmzuFsZI1Oo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YiRtdLtgvAQ/CJB/CQKrXiZ8PfFoLT7ME9mpjnRFq6FE6E3s7mnreCUv+VGznfnNxM07iM4Khoffh5WjWoPsXPTux3UMQtClGGNagtEwtSVpQGyOyEmCEnadDZPTwSHVQIPtHd+c3O7UEG/bF9Bbbkh9ntWYjjhpxSqkucMV/qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jiQJKCro; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-144-210.elisa-laajakaista.fi [91.158.144.210])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D8B2839F;
	Mon, 10 Jun 2024 11:02:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718010174;
	bh=bxWJXERRdoJzHbQqWjxH5WKbFDkVnAeUJmzuFsZI1Oo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jiQJKCro/zQwJ8QhSUpZAnVtjhD6QmoGwVTMsRtnai/9vREbYGU3PKgaDLHU0TbCk
	 zgbBn+YbxomOxPS47rwkMh3wFnQeurY31UodstOkBUUQGIUfOF8+tnJGHmumDeXLBo
	 wttZpoecjsooF5PfTPbETO+TVvmtLq0/QmsscXGI=
Message-ID: <5a60495e-308e-46cb-862d-15515421515e@ideasonboard.com>
Date: Mon, 10 Jun 2024 12:03:02 +0300
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
Cc: linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
References: <20240610012238.30462-1-laurent.pinchart@ideasonboard.com>
 <20240610012238.30462-4-laurent.pinchart@ideasonboard.com>
 <fc1ff8b7-5404-44f3-acf5-9ee2e7b43c4d@ideasonboard.com>
 <20240610090028.GL18479@pendragon.ideasonboard.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20240610090028.GL18479@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/06/2024 12:00, Laurent Pinchart wrote:
> Hi Tomi,
> 
> On Mon, Jun 10, 2024 at 09:14:59AM +0300, Tomi Valkeinen wrote:
>> On 10/06/2024 04:22, Laurent Pinchart wrote:
>>> Add a -W/--which argument to media-ctl to select which state to operate
>>> on. Default to the ACTIVE state to preserve the current behaviour.
>>>
>>> Despite the fact that all values set on the TRY state are lost when
>>> media-ctl terminates, support for the TRY state is useful in order to
>>> retrieve the default configuration of subdevs, or to try configurations.
>>
>> I think this is fine, but I'm curious why you chose such an argument. I
>> would have thought "-t/--try" (or even just --try) would have been
>> simpler to implement and to use. I think I would remember "--try"
>> easily, but "-W TRY", I fear I'll have to check the man page every time...
> 
> There are a few reasons:
> 
> - Be closer to the API (media-ctl is a low-level tool)
> - Support other values later if the kernel API evolves (no plan for
>    that, but who knows ?)
> - I find it easier to propagate arguments in scripts this way. If a
>    script that wraps media-ctl receives a nothing/--try argument, it's
>    fairly easy to translate that to nothing/-W TRY. If it receives a
>    --foo ACTIVE/TRY argument (on the command line, in an interactive
>    prompt, as part of a string that tells what to do on a pad, ...), then
>    translating that to '-W arg' is easier than to nothing/-W TRY.

Thanks.

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi

>>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>> ---
>>>    utils/media-ctl/media-ctl.c | 13 +++++++------
>>>    utils/media-ctl/options.c   | 18 +++++++++++++++++-
>>>    utils/media-ctl/options.h   |  1 +
>>>    3 files changed, 25 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/utils/media-ctl/media-ctl.c b/utils/media-ctl/media-ctl.c
>>> index 42b1bd9aaa6e..33df0880fd9b 100644
>>> --- a/utils/media-ctl/media-ctl.c
>>> +++ b/utils/media-ctl/media-ctl.c
>>> @@ -600,7 +600,6 @@ static void media_print_topology_text(struct media_device *media,
>>>    
>>>    int main(int argc, char **argv)
>>>    {
>>> -	const enum v4l2_subdev_format_whence which = V4L2_SUBDEV_FORMAT_ACTIVE;
>>>    	struct media_device *media;
>>>    	struct media_entity *entity = NULL;
>>>    	int ret = -1;
>>> @@ -667,7 +666,8 @@ int main(int argc, char **argv)
>>>    			goto out;
>>>    		}
>>>    
>>> -		v4l2_subdev_print_format(pad->entity, pad->index, stream, which);
>>> +		v4l2_subdev_print_format(pad->entity, pad->index, stream,
>>> +					 media_opts.which);
>>>    	}
>>>    
>>>    	if (media_opts.get_dv_pad) {
>>> @@ -709,9 +709,10 @@ int main(int argc, char **argv)
>>>    		media_print_topology_dot(media);
>>>    	} else if (media_opts.print) {
>>>    		if (entity)
>>> -			media_print_topology_text_entity(media, entity, which);
>>> +			media_print_topology_text_entity(media, entity,
>>> +							 media_opts.which);
>>>    		else
>>> -			media_print_topology_text(media, which);
>>> +			media_print_topology_text(media, media_opts.which);
>>>    	} else if (entity) {
>>>    		const char *devname;
>>>    
>>> @@ -741,7 +742,7 @@ int main(int argc, char **argv)
>>>    	}
>>>    
>>>    	if (media_opts.routes) {
>>> -		ret = v4l2_subdev_parse_setup_routes(media, which,
>>> +		ret = v4l2_subdev_parse_setup_routes(media, media_opts.which,
>>>    						     media_opts.routes);
>>>    		if (ret) {
>>>    			printf("Unable to setup routes: %s (%d)\n",
>>> @@ -751,7 +752,7 @@ int main(int argc, char **argv)
>>>    	}
>>>    
>>>    	if (media_opts.formats) {
>>> -		ret = v4l2_subdev_parse_setup_formats(media, which,
>>> +		ret = v4l2_subdev_parse_setup_formats(media, media_opts.which,
>>>    						      media_opts.formats);
>>>    		if (ret) {
>>>    			printf("Unable to setup formats: %s (%d)\n",
>>> diff --git a/utils/media-ctl/options.c b/utils/media-ctl/options.c
>>> index 3c408a1b9b06..3606525c33da 100644
>>> --- a/utils/media-ctl/options.c
>>> +++ b/utils/media-ctl/options.c
>>> @@ -40,6 +40,7 @@
>>>    
>>>    struct media_options media_opts = {
>>>    	.devname = MEDIA_DEVNAME_DEFAULT,
>>> +	.which = V4L2_SUBDEV_FORMAT_ACTIVE,
>>>    };
>>>    
>>>    static void print_version()
>>> @@ -75,6 +76,7 @@ static void usage(const char *argv0)
>>>    	printf("-r, --reset		Reset all links to inactive\n");
>>>    	printf("-v, --verbose		Be verbose\n");
>>>    	printf("    --version		Show version information\n");
>>> +	printf("-W, --which which	Select the subdev state to operate on\n");
>>>    	printf("\n");
>>>    	printf("Links and formats are defined as\n");
>>>    	printf("\tlinks           = link { ',' link } ;\n");
>>> @@ -140,6 +142,8 @@ static void usage(const char *argv0)
>>>    	for (i = V4L2_YCBCR_ENC_DEFAULT; i <= V4L2_YCBCR_ENC_SMPTE240M; i++)
>>>    		printf("\t                %s\n",
>>>    		       v4l2_subdev_ycbcr_encoding_to_string(i));
>>> +
>>> +	printf("\twhich           Subdev state ('ACTIVE' or 'TRY')\n");
>>>    }
>>>    
>>>    #define OPT_PRINT_DOT			256
>>> @@ -168,6 +172,7 @@ static struct option opts[] = {
>>>    	{"reset", 0, 0, 'r'},
>>>    	{"verbose", 0, 0, 'v'},
>>>    	{"version", 0, 0, OPT_VERSION},
>>> +	{"which", 1, 0, 'W'},
>>>    	{ },
>>>    };
>>>    
>>> @@ -244,7 +249,7 @@ int parse_cmdline(int argc, char **argv)
>>>    	}
>>>    
>>>    	/* parse options */
>>> -	while ((opt = getopt_long(argc, argv, "d:e:f:hil:prvV:R:",
>>> +	while ((opt = getopt_long(argc, argv, "d:e:f:hil:prvV:R:W:",
>>>    				  opts, NULL)) != -1) {
>>>    		switch (opt) {
>>>    		case 'd':
>>> @@ -294,6 +299,17 @@ int parse_cmdline(int argc, char **argv)
>>>    			media_opts.routes = optarg;
>>>    			break;
>>>    
>>> +		case 'W':
>>> +			if (!strcmp(optarg, "ACTIVE"))
>>> +				media_opts.which = V4L2_SUBDEV_FORMAT_ACTIVE;
>>> +			else if (!strcmp(optarg, "TRY"))
>>> +				media_opts.which = V4L2_SUBDEV_FORMAT_TRY;
>>> +			else {
>>> +				printf("Invalid 'which' value '%s'\n", optarg);
>>> +				return 1;
>>> +			}
>>> +			break;
>>> +
>>>    		case OPT_PRINT_DOT:
>>>    			media_opts.print_dot = 1;
>>>    			break;
>>> diff --git a/utils/media-ctl/options.h b/utils/media-ctl/options.h
>>> index 753d09347585..095729b98014 100644
>>> --- a/utils/media-ctl/options.h
>>> +++ b/utils/media-ctl/options.h
>>> @@ -37,6 +37,7 @@ struct media_options
>>>    	const char *get_dv_pad;
>>>    	const char *dv_pad;
>>>    	const char *routes;
>>> +	enum v4l2_subdev_format_whence which;
>>>    };
>>>    
>>>    extern struct media_options media_opts;
>>
> 


