Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 406E0AF685
	for <lists+linux-media@lfdr.de>; Wed, 11 Sep 2019 09:14:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726794AbfIKHNC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Sep 2019 03:13:02 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:51433 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726781AbfIKHNC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Sep 2019 03:13:02 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 7woCiasig9b7T7woGikVQL; Wed, 11 Sep 2019 09:13:00 +0200
Subject: Re: [PATCH v2] cec-compliance: system audio control
To:     Jiunn Chang <c0d1n61at3@gmail.com>, linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
References: <20190909202030.82287-1-c0d1n61at3@gmail.com>
 <20190910193458.53210-2-c0d1n61at3@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <7daae43c-5d54-9cb9-25e4-2a130a3cb368@xs4all.nl>
Date:   Wed, 11 Sep 2019 09:12:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190910193458.53210-2-c0d1n61at3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfItKlAVwwpd5oE800jDhBF9A0S2BZlS3NoFrQvsTZCIAR50shaoZhxen7eW2blphOPksghnNPnFiqL2ogX2Eu8aDE28Q2IY0eS8TuRWf65ZgCq4LP0yk
 fDAp13/7G0NVA8gdun0ooG5vWX0fwRK309Tq9GzIjv9SWCcblDrNYNiJeZasCGt1wqkmTcuWWSc/CSo3i3KmhK/074EvkCBpI+i66zOZTiO2TYi0/bis6GX4
 gWvieGzbK5cqgiIaRZnpGcX7AQJxceJuX7NJNlA4z2I=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jiunn,

A few nitpicks below:

On 9/10/19 9:34 PM, Jiunn Chang wrote:
> Add comment block documenting tests not included from section 13.15 of
> the CEC 1.4b specification.  This section outlines the System Audio
> Control feature.
> 
> Signed-off-by: Jiunn Chang <c0d1n61at3@gmail.com>
> ---
>  utils/cec-compliance/cec-test-audio.cpp | 29 +++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/utils/cec-compliance/cec-test-audio.cpp b/utils/cec-compliance/cec-test-audio.cpp
> index 2bc24daf..14f1d122 100644
> --- a/utils/cec-compliance/cec-test-audio.cpp
> +++ b/utils/cec-compliance/cec-test-audio.cpp
> @@ -309,6 +309,35 @@ const unsigned arc_subtests_size = ARRAY_SIZE(arc_subtests);
>  
>  /* System Audio Control */
>  
> +/*
> + * The following scenarios are defined in section 13.15 of the CEC 1.4b

It's CEC 1.4, not 1.4b. The version number refers to the corresponding HDMI
specification that first defined this CEC version, which was HDMI 1.4. Later
small HDMI updates were releases (1.4a and 1.4b), but the CEC spec remained
unchanged. So CEC 1.4 is the right CEC version number to use, and it applies
to HDMI 1.4, 1.4a and 1.4b.

So replace 1.4b in this comment block with 1.4.

> + * specification where the amplifier provides the audio for a source that
> + * is being displayed on a TV.
> + *
> + * 1.  Amplifier initiated <System Audio Mode Request> and active source
> + *     discovery with a <Request Active Source> broadcast plus the
> + *     <Active Source> response.
> + * 2.  Post discovery, subsequent amplifier <Set System Audio Mode> [On]
> + *     and System Audio Control feature confirmation with TV.
> + * 3.  Amplifier broadcasts <Set System Audio Mode> [On] to mute the TV and
> + *     unmute amplifier.
> + * 4.  Amplifier broadcasts <Set System Audio Mode> [Off] to unmute the TV
> + *     and mute the amplifier.
> + * 5.  When System Audio Mode is On, muting and unmuting an amplifier sends
> + *     a <Report Audio Status> message to the TV.
> + * 6.  When System Audio Mode is On, the amplifier sends a <Set System Audio
> + *     Mode> [Off] to unmute the TV before going into standby.
> + * 7.  When System Audio Mode is On, only the amplifier can control system
> + *     volume.
> + * 8.  Optional features in subsection 13.15.4 of version 1.4b.
> + * 9.  <Request Audio Descriptor> message is from version 1.4 so older versions
> + *     report <Feature Abort>.
> + * 10. <Report Audio Descriptor> message is from version 1.4 so older versions
> + *     report <Feature Abort>.
> + * 11. System Audio Control is from version 1.3a so older versions report
> + *     <Feature Abort>.

I would like to see that the reason why these scenarios are not implemented is
added as well.

For 1-7 I think that is because you need three CEC devices for testing.
9-11 deal with 1.3a or older versions and is not worth spending time on.
8 is because these are hard-to-test corner cases.

Regards,

	Hans

> + */
> +
>  static int sac_request_sad_probe(struct node *node, unsigned me, unsigned la, bool interactive)
>  {
>  	struct cec_msg msg = {};
> 

