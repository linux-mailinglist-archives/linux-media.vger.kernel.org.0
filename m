Return-Path: <linux-media+bounces-17463-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AC453969A7D
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 12:45:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF3731C2360B
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 10:45:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C4DF1B9829;
	Tue,  3 Sep 2024 10:45:26 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87C31A0BFC
	for <linux-media@vger.kernel.org>; Tue,  3 Sep 2024 10:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725360325; cv=none; b=MCqyzmOw+TBQ8gsOc5pfB7YwffeQkqLetGpXVqOEiirVrdju40/W9Yzom7aBJehQGDAqsjWkcGVHzbzpT5MhLr8weSP8PBk6AUrY9GeM++REp3i7TEkV+yoKsq5xsQPGN8GLnsWTwuI/LLVIf62FJVXwJLtOYBpV4fxRUe19Lvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725360325; c=relaxed/simple;
	bh=S38IhQVn/EIlI3IEygcNQf4s+5TXx6IpBgjKPOUd4jY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=GhTIhXMwozG0GqK9iHhqBZHoXdbDc0MII3n8QVW55RLR0CLSR+din3HI7WVqj/1mSk+pWBpb2BLq4aEd6NcKRkOfQGSlA0PVJ1PKIKwA3dr3H/pmGSl8mv8pTq/BkwBZ2jeWmTVpv/rySgLLa5Y7mbk7Vm016gtaDFrfUfL5Ccs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3286C4CEC4;
	Tue,  3 Sep 2024 10:45:23 +0000 (UTC)
Message-ID: <254a983e-5ccf-4989-8354-0eff08214892@xs4all.nl>
Date: Tue, 3 Sep 2024 12:45:21 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] edid-decode: Fix Visual Studio builds. Add utf-8 option
 and parse-if.cpp file.
To: Wei Feng Lin <franklin@pcpartner.com>, linux-media@vger.kernel.org
References: <20240903070040.6283-1-franklin@pcpartner.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <20240903070040.6283-1-franklin@pcpartner.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/09/2024 09:00, Wei Feng Lin wrote:
> Add the /utf-8 option to resolve the issue of not being able to compile parse-base-block.cpp.
> Include parse-if.cpp in the compilation to resolve the issue of missing parse_if_vendor and
> other functions during linking.

Merged.

Thank you for keeping the Visual Studio build up to date!

Regards,

	Hans

> 
> Signed-off-by: Wei Feng Lin <franklin@pcpartner.com>
> ---
>  vs/edid-decode.vcxproj         | 3 +++
>  vs/edid-decode.vcxproj.filters | 3 +++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/vs/edid-decode.vcxproj b/vs/edid-decode.vcxproj
> index 7b840ac..2c21187 100644
> --- a/vs/edid-decode.vcxproj
> +++ b/vs/edid-decode.vcxproj
> @@ -59,6 +59,7 @@
>        <ConformanceMode>true</ConformanceMode>
>        <AdditionalIncludeDirectories>$(ProjectDir);%(AdditionalIncludeDirectories)</AdditionalIncludeDirectories>
>        <DisableSpecificWarnings>4244; 4018; 4267; 4996; 26451; 6385; 6001</DisableSpecificWarnings>
> +      <AdditionalOptions>/utf-8</AdditionalOptions>
>      </ClCompile>
>      <Link>
>        <SubSystem>Console</SubSystem>
> @@ -86,6 +87,7 @@
>        <AdditionalIncludeDirectories>$(ProjectDir);%(AdditionalIncludeDirectories)</AdditionalIncludeDirectories>
>        <DisableSpecificWarnings>4244; 4018; 4267; 4996; 26451; 6385; 6001</DisableSpecificWarnings>
>        <RuntimeLibrary>MultiThreaded</RuntimeLibrary>
> +      <AdditionalOptions>/utf-8</AdditionalOptions>
>      </ClCompile>
>      <Link>
>        <SubSystem>Console</SubSystem>
> @@ -97,6 +99,7 @@
>    <ItemGroup>
>      <ClCompile Include="..\calc-gtf-cvt.cpp" />
>      <ClCompile Include="..\calc-ovt.cpp" />
> +    <ClCompile Include="..\parse-if.cpp" />
>      <ClCompile Include="getopt.c" />
>      <ClCompile Include="..\edid-decode.cpp" />
>      <ClCompile Include="..\parse-base-block.cpp" />
> diff --git a/vs/edid-decode.vcxproj.filters b/vs/edid-decode.vcxproj.filters
> index b98ab04..0b78516 100644
> --- a/vs/edid-decode.vcxproj.filters
> +++ b/vs/edid-decode.vcxproj.filters
> @@ -43,6 +43,9 @@
>      <ClCompile Include="..\calc-ovt.cpp">
>        <Filter>edid-decode</Filter>
>      </ClCompile>
> +    <ClCompile Include="..\parse-if.cpp">
> +      <Filter>edid-decode</Filter>
> +    </ClCompile>
>    </ItemGroup>
>    <ItemGroup>
>      <ClInclude Include="..\edid-decode.h">


