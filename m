Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B77A221B67C
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2020 15:33:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727078AbgGJNdb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Jul 2020 09:33:31 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:46583 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726840AbgGJNdb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Jul 2020 09:33:31 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id tt9ZjnLLAJcNHtt9djs5g8; Fri, 10 Jul 2020 15:33:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1594388009; bh=jcRKTIvQTmwzPlwW9K80hLvz9JhzaQa/1a4z68Si8x8=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=aox7EoM4/CxlTG2Fu+R5NpoP6ZF9OZMWppDrwjRzr3NaHfhXxW7jDczbKXPHSpQsB
         1y+3vh2jIzql200r0Y1nDMHkCD+t+sf6IW8IkoqT0p1ZE8xTk5glc6xjLpo1ZabeRG
         e+RhiHrf7MNMvcYwTv7aIuxrTGc7YbbRviXafCEbYCAK1XIGo/KYJR6C9aHZh/sXYN
         zT98QC8+x02FNN5Tn4DDyS2RXIDES2ZHzjKu0fX5nL/1gKRQ9GSVpDgdCHrAboz8Al
         0XnQMYo69//KI5AKDeNJ6uW3siyO4RikevgCmaQFfTrSNA5QcLR9pzg4MWEBgRm1tZ
         +rQyyIcxsL5XQ==
Subject: Re: [PATCH 1/2] v4l2-compliance: Add version command
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Paul Elder <paul.elder@ideasonboard.com>
Cc:     linux-media@vger.kernel.org
References: <20200710131813.452513-1-paul.elder@ideasonboard.com>
 <20200710132536.GX5964@pendragon.ideasonboard.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <3b0dd8f8-00b0-2a94-f040-c9619a99e201@xs4all.nl>
Date:   Fri, 10 Jul 2020 15:33:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200710132536.GX5964@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfB5Uov70LxcQyaBeTykp7eOBqT3ymD9Y+lHejn87+cDK96y+C696qPQpMg+Rbx4NoEjx1r17QKAse6CXZA+zh7OGjPhzroRDdjUBEzFHVlpAqkL+skmM
 R2u/9l5YAXDibtW2hxiukGctHSdmnN5zsUmRlieyx2b5Pv4kY4R/rEP9lCXeE+f0PljEJ2ntP0jQq3Qncf31o9ihNqMYrsh9HDCWn1bazHXbUhnURL+aDF0l
 mMh9IpH7/6Yh9zOk1a99I0PqF70uovWA2Q9HL3MAvCc=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/07/2020 15:25, Laurent Pinchart wrote:
> Hi Paul,
> 
> Thank you for the patch.
> 
> On Fri, Jul 10, 2020 at 10:18:12PM +0900, Paul Elder wrote:
>> Add a --version option to v4l2-compliance to retrieve the version of
>> v4l2-compliance.
>>
>> Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
>> ---
>>  utils/v4l2-compliance/v4l2-compliance.cpp | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
>> index 4b45f110..72b9768f 100644
>> --- a/utils/v4l2-compliance/v4l2-compliance.cpp
>> +++ b/utils/v4l2-compliance/v4l2-compliance.cpp
>> @@ -79,6 +79,7 @@ enum Option {
>>  	OptMediaBusInfo = 'z',
>>  	OptStreamFrom = 128,
>>  	OptStreamFromHdr,
>> +	OptVersion,
>>  	OptLast = 256
>>  };
>>  
>> @@ -153,9 +154,15 @@ static struct option long_options[] = {
>>  	{"stream-all-formats", optional_argument, 0, OptStreamAllFormats},
>>  	{"stream-all-io", no_argument, 0, OptStreamAllIO},
>>  	{"stream-all-color", required_argument, 0, OptStreamAllColorTest},
>> +	{"version", no_argument, 0, OptVersion},
>>  	{0, 0, 0, 0}
>>  };
>>  
>> +static void version()
>> +{
>> +	printf("v4l2-compliance " PACKAGE_VERSION "\n");
> 
> Is it enough to rely on the v4l-utils package version, or should we add
> a git commit count as well ? The traditional version number will make it
> difficult to test for features added between two released versions.

If you add a version option, then v4l2-compliance should also show the SHA.
It's already available (grep for SHA), so easy enough to add here.

Also, if you add --version here, then it really should be added to most
other utils as well (certainly media-ctl and cec-follower/ctl/compliance).

Regards,

	Hans

> 
>> +}
>> +
>>  static void usage()
>>  {
>>  	printf("Usage:\n");
>> @@ -244,6 +251,7 @@ static void usage()
>>  	printf("  -P, --no-progress  Turn off progress messages.\n");
>>  	printf("  -T, --trace        Trace all called ioctls.\n");
>>  	printf("  -v, --verbose      Turn on verbose reporting.\n");
>> +	printf("  --version          Show version information.\n");
>>  #ifndef NO_LIBV4L2
>>  	printf("  -w, --wrapper      Use the libv4l2 wrapper library.\n");
>>  #endif
>> @@ -1664,6 +1672,9 @@ int main(int argc, char **argv)
>>  		case OptNoProgress:
>>  			no_progress = true;
>>  			break;
>> +		case OptVersion:
>> +			version();
>> +			std::exit(EXIT_SUCCESS);
>>  		case ':':
>>  			fprintf(stderr, "Option `%s' requires a value\n",
>>  				argv[optind]);
> 

