Return-Path: <linux-media+bounces-47703-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E89C8537F
	for <lists+linux-media@lfdr.de>; Tue, 25 Nov 2025 14:41:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2463235131B
	for <lists+linux-media@lfdr.de>; Tue, 25 Nov 2025 13:41:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 055AC223DD0;
	Tue, 25 Nov 2025 13:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Skubse/+"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5727D21D596
	for <linux-media@vger.kernel.org>; Tue, 25 Nov 2025 13:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764078063; cv=none; b=mRDPdy1X8LfNkLh9Tqrz/rynK3PC5sF78i0vBGAIwHcc9A379QQ9ImJQGP4hRoYX/tQlaHEeQqP5c4qU0dszVwZWuVQmbfoih01ClS0VsSkewBXxI97yblnJW+2Tia4GFf8fDpZ7DxZt51JWveI/suNSfKLdTdGwjjmKSD2eILs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764078063; c=relaxed/simple;
	bh=qcIeO4J4N+jvofmvdFIndBryMiwqOOzlbL46YvGPYLw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=AXMq+fUUtsdqc9tCo7LWnVrtxjIyK0pbwNdJfbaMfZjzKvTMQSKRpO9jq6aVqNkuvnTNNfabQs5Tf2aTW33do+5kZ13xD3aVvpOUwSNBq07Y3koP/G2JxJDjrZa6WeTDRNdV+qt9eFpEuxV1QMSBW1MJtFdUhKRBJUtT4NCOO3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Skubse/+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4108FC4CEF1;
	Tue, 25 Nov 2025 13:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764078062;
	bh=qcIeO4J4N+jvofmvdFIndBryMiwqOOzlbL46YvGPYLw=;
	h=Date:From:Subject:To:References:In-Reply-To:From;
	b=Skubse/+DsEf8KbI0konvjCK4zz7R14AEj/EjPnPkdRi2lKge0yXvN3irpXHIpumn
	 VCObm/m8O+9BNOjGY3CWQOPiclRyXnBYls9QZip/D8T0uZxO5hvIHqZ06Uok/Yogor
	 U0lTfk0Pat8gTHQ5roVFf/WBcjZD49V0kKQcJ4IOZe8yTAJHu7569cklU1JDMmGjiK
	 +ImwrWrL+i0DbAK0PfNXYcYBFE2AGU5iGqMctKsInNc8O6vyWlAKJh6Boou5qsDf0N
	 8jA9qPyGUQAtiAc5Gk7hJb0hd11GdxF+8Os1MqUj8J5PbbbZr3HxS6trNqWFuR/Xf9
	 18Vuz3Q4wKebg==
Message-ID: <b874feba-1fac-43b1-a601-c08ace37db86@kernel.org>
Date: Tue, 25 Nov 2025 14:41:00 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v4l-utils] edid-decode: add more details to the AMD VSDB
To: Julian Orth <ju.orth@gmail.com>, linux-media@vger.kernel.org
References: <20251120-jorth-amd-v1-1-670ec8092d62@gmail.com>
Content-Language: en-US, nl
In-Reply-To: <20251120-jorth-amd-v1-1-670ec8092d62@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Julian,

On 20/11/2025 16:17, Julian Orth wrote:
> These values have been determined through reverse engineering and might
> be inaccurate.
> 
> Signed-off-by: Julian Orth <ju.orth@gmail.com>

Thank you for the patch, I've merged it.

Nice to have a bit more info about the Freesync data.

Regards,

	Hans

> ---
> These values have been determined through reverse engineering and might
> be inaccurate.
> 
> [1] contains the diff of the EDID database when regenerating everything
> after applying this patch.
> 
> [1]: https://github.com/mahkoh/EDID/commit/271605f9a18b06e3df90b7c690f53e76256be8dd.diff
> ---
>  utils/edid-decode/parse-cta-block.cpp | 183 +++++++++++++++++++++++++---------
>  1 file changed, 137 insertions(+), 46 deletions(-)
> 
> diff --git a/utils/edid-decode/parse-cta-block.cpp b/utils/edid-decode/parse-cta-block.cpp
> index 3783a32e..ecf32b9f 100644
> --- a/utils/edid-decode/parse-cta-block.cpp
> +++ b/utils/edid-decode/parse-cta-block.cpp
> @@ -1576,60 +1576,151 @@ static void cta_hf_sbtmdb(const unsigned char *x, unsigned length)
>  
>  static void cta_amd(const unsigned char *x, unsigned length)
>  {
> -	// These Freesync values are reversed engineered by looking
> -	// at existing EDIDs.
> -	printf("    Version: %u\n", x[0]);
> +    // x[00]          - major version
> +    // x[01] & 0x01   - unknown, set in almost all EDIDs
> +    // x[01] & 0x02   - set if x[05..=09] are valid
> +    // x[01] & 0x04   - global backlight control support
> +    // x[01] & 0x08   - local dimming support
> +    // x[01] & 0x10   - FreeSync Panel Replay/PSR switch support
> +    // x[01] & 0x20   - called the SPRS bit by AMD, related to Replay
> +    // x[01] & 0x40   - FreeSync Panel Replay support
> +    // x[01] & 0x80   - set if x[12..=14] are valid
> +    // x[02]          - min refresh rate
> +    // x[03]          - max refresh rate in versions < 3
> +    // x[04]          - MCCS flags
> +    // -- start of version 2 fields
> +    // x[05] & 0x01   - unknown
> +    // x[05] & 0x02   - unknown
> +    // x[05] & 0x04   - PQ EOTF support
> +    // x[05] & 0x08   - unknown
> +    // x[05] & 0x10   - PQ-Interim EOTF support (unknown what that is but enumerated in ADL)
> +    // x[05] & 0x20   - unknown but see the calculation of supported_tf below
> +    // x[05] & 0xc0   - set to 1 if the display is Mini LED
> +    //                  set to 2 if the display is OLED
> +    // x[06]          - max luminance
> +    // x[07]          - min luminance
> +    // x[08]          -      if x[01] & 0x08 or display is OLED: max luminance without local dimming
> +    //                  else if x[01] & 0x04                   : max luminance at min backlight
> +    // x[09]          -      if x[01] & 0x08 or display is OLED: min luminance without local dimming
> +    //                  else if x[01] & 0x04                   : min luminance at min backlight
> +    // -- start of version 3 fields
> +    // x[10]          - max refresh rate lower 8 bits in version >= 3
> +    // x[11] & 0x03   - max refresh rate upper 2 bits in version >= 3
> +    // x[11] & 0xfc   - unused
> +    // -- end of version 3 mandatory fields, fields below will be parsed only if the VSDB
> +    //    block is large enough
> +    // x[12]          - unknown
> +    // x[13]          - unknown
> +    // x[14]          - unknown
> +    // x[15] & 0x80   - x[15] & 0x7f is valid
> +    // x[15] & 0x7f   - unknown
> +    // x[16] & 0x80   - x[16] & 0x7f is valid
> +    // x[16] & 0x7f   - DPCD (DisplayPort configuration data) register offset for
> +    //                  proprietary AMD settings
> +
> +    if (length < 5) {
> +        printf("    Data block is truncated (length = %d)\n", length);
> +        return;
> +    }
> +
> +    unsigned version = x[0];
> +	printf("    Version: %u\n", version);
>  
> -	// Obtained from:
> -	// https://github.com/torvalds/linux/commit/ec8e59cb4e0c1a52d5a541fff9dcec398b48f7b4
>  	printf("    Feature Caps: 0x%02x\n", x[1]);
> -	if (x[1] & 0x40)
> -		printf("      Replay Supported\n");
> -
> +    bool hdr_fields_valid = false;
> +    bool supports_local_dimming = false;
> +    bool has_global_backlight_control = false;
> +    if (version > 1) {
> +        hdr_fields_valid = x[1] & 0x02;
> +        has_global_backlight_control = x[1] & 0x04;
> +        supports_local_dimming = x[1] & 0x08;
> +        if (has_global_backlight_control)
> +            printf("      Global Backlight Control Supported\n");
> +        if (supports_local_dimming)
> +            printf("      Local Dimming Supported\n");
> +        if (version > 2) {
> +            // Obtained from:
> +            // https://github.com/torvalds/linux/commit/ec8e59cb4e0c1a52d5a541fff9dcec398b48f7b4
> +            if (x[1] & 0x40)
> +                printf("      FreeSync Panel Replay Supported\n");
> +        }
> +    }
> +
> +    unsigned short max_refresh_rate;
> +    if (version > 2 && length > 0xb) {
> +        max_refresh_rate = (x[0xb] & 3) << 8 | x[0xa];
> +    } else {
> +        max_refresh_rate = x[3];
> +    }
>  	printf("    Minimum Refresh Rate: %u Hz\n", x[2]);
> -	printf("    Maximum Refresh Rate: %u Hz\n", x[3]);
> +	printf("    Maximum Refresh Rate: %u Hz\n", max_refresh_rate);
>  	// Freesync 1.x flags
>  	// One or more of the 0xe6 bits signal that the VESA MCCS
>  	// protocol is used to switch the Freesync range
>  	printf("    Flags 1.x: 0x%02x%s\n", x[4],
>  	       (x[4] & 0xe6) ? " (MCCS)" : "");
> -	if (length >= 10) {
> -		// Freesync 2.x flags
> -		// Bit 2 no doubt indicates if the monitor supports Local Dimming
> -		// There are probably also bits to signal support of the
> -		// FreeSync2_scRGB and FreeSync2_Gamma22 HDR display modes.
> -		// I suspect bits 0 and 1.
> -		printf("    Flags 2.x: 0x%02x\n", x[5]);
> -		// The AMD tone mapping tutorial referred to in the URL below
> -		// mentions that the Freesync HDR info reports max/min
> -		// luminance of the monitor with and without local dimming.
> -		//
> -		// https://gpuopen.com/learn/using-amd-freesync-premium-pro-hdr-code-samples/
> -		//
> -		// So I assume that the first two luminance values are
> -		// the max/min luminance of the display and the next two
> -		// luminance values are the max/min luminance values when
> -		// local dimming is disabled. The values I get seem to
> -		// support that.
> -		printf("    Maximum luminance: %u (%.3f cd/m^2)\n",
> -		       x[6], 50.0 * pow(2, x[6] / 32.0));
> -		printf("    Minimum luminance: %u (%.3f cd/m^2)\n",
> -		       x[7], (50.0 * pow(2, x[6] / 32.0)) * pow(x[7] / 255.0, 2) / 100.0);
> -		if (x[5] & 4) {
> -			// One or both bytes can be 0. The meaning of that
> -			// is unknown.
> -			printf("    Maximum luminance (without local dimming): %u (%.3f cd/m^2)\n",
> -			       x[8], 50.0 * pow(2, x[8] / 32.0));
> -			printf("    Minimum luminance (without local dimming): %u (%.3f cd/m^2)\n",
> -			       x[9], (50.0 * pow(2, x[8] / 32.0)) * pow(x[9] / 255.0, 2) / 100.0);
> -		} else {
> -			// These bytes are always 0x08 0x2f. If these values
> -			// represent max/min luminance as well, then these
> -			// would map to 59.460 and 0.020 cd/m^2 respectively.
> -			// I wonder if this somehow relates to SDR.
> -			printf("    Unknown: 0x%02x 0x%02x\n", x[8], x[9]);
> -		}
> -	}
> +
> +    if (version < 2)
> +        return;
> +    if (length < 10) {
> +        printf("    Data block is truncated (length = %d)\n", length);
> +        return;
> +    }
> +
> +    printf("    Flags 2.x: 0x%02x\n", x[5]);
> +
> +    if (!hdr_fields_valid)
> +        return;
> +
> +    const unsigned TF_PQ2084         = 0x0004;
> +    const unsigned TF_LINEAR_0_125   = 0x0020;
> +    const unsigned TF_GAMMA_22       = 0x0080;
> +
> +    const unsigned CS_BT2020         = 0x0008;
> +
> +    // the calculation of supported_tf is a bit weird because it doesn't correspond to
> +    // the description in the comment at the start of the function. but this is what ADL
> +    // (AMD Display Library) reports
> +    unsigned supported_tf = 0;
> +    unsigned supported_cs = 0;
> +    bool supports_hdr10 = x[5] & 0x34;
> +    if (supports_hdr10) {
> +        supported_tf |= TF_LINEAR_0_125 | TF_PQ2084;
> +        supported_cs |= CS_BT2020;
> +    }
> +    if (x[5] & 0x04)
> +        supported_tf |= TF_GAMMA_22;
> +
> +    if (supported_tf & TF_PQ2084)
> +        printf("      ST 2084 (PQ) EOTF Supported\n");
> +    if (supported_tf & TF_LINEAR_0_125)
> +        printf("      Linear EOTF (Windows scRGB, 0.0 - 125.0) Supported\n");
> +    if (supported_tf & TF_GAMMA_22)
> +        printf("      Gamma 2.2 EOTF Supported\n");
> +
> +    if (supported_cs & CS_BT2020)
> +        printf("      BT.2020 Gamut Supported\n");
> +
> +    bool is_mini_led = x[5] >> 5 == 1;
> +    bool is_oled     = x[5] >> 5 == 2;
> +    if (is_mini_led)
> +        printf("      Display is Mini LED\n");
> +    if (is_oled)
> +        printf("      Display is OLED\n");
> +
> +    printf("    Maximum luminance: %u (%.3f cd/m^2)\n",
> +           x[6], 50.0 * pow(2, x[6] / 32.0));
> +    printf("    Minimum luminance: %u (%.3f cd/m^2)\n",
> +           x[7], (50.0 * pow(2, x[6] / 32.0)) * pow(x[7] / 255.0, 2) / 100.0);
> +    if (supports_local_dimming || is_oled || has_global_backlight_control) {
> +        const char *type = "minimum backlight";
> +        if (supports_local_dimming || is_oled)
> +            type = "without local dimming";
> +        printf("    Maximum luminance (%s): %u (%.3f cd/m^2)\n",
> +               type, x[8], 50.0 * pow(2, x[8] / 32.0));
> +        printf("    Minimum luminance (%s): %u (%.3f cd/m^2)\n",
> +               type, x[9], (50.0 * pow(2, x[8] / 32.0)) * pow(x[9] / 255.0, 2) / 100.0);
> +    }
>  }
>  
>  static std::string display_use_case(unsigned char x)
> 
> ---
> base-commit: af4a91dea9a25f05af5a1b8a26064d7072ae7a79
> change-id: 20251120-jorth-amd-aeaa40d6c0b8
> 
> Best regards,


