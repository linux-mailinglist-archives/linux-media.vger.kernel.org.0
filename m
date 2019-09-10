Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94414AE407
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2019 08:53:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731027AbfIJGx1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Sep 2019 02:53:27 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:49777 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727816AbfIJGx1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Sep 2019 02:53:27 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 7a1ii8awp50xT7a1liDbR6; Tue, 10 Sep 2019 08:53:25 +0200
Subject: Re: [PATCH] cec-compliance: system audio control
To:     Jiunn Chang <c0d1n61at3@gmail.com>, linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
References: <20190909202030.82287-1-c0d1n61at3@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <8f5fc753-35e4-4b51-0341-f7d1e6100890@xs4all.nl>
Date:   Tue, 10 Sep 2019 08:53:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190909202030.82287-1-c0d1n61at3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfDQ8ebqRsDBf6UELYFDecHDSmHGTu1LLXthOVN1+bzgwkzguUua4ygmpLxBno6UhVIKu7SM+6QrKNmrveGyila7L3qwgxJ5Ly4KHSbOpGbukoV0Ua0vP
 AJaK5t8BR8UZgSgcP4zQrsoamfJbmTLS2lBi3WNrt2cqhp7DG+n3kSMoJddVu8kdcxYt83FxOrocTr56NPIHGIvNRjLN+yVLIgjF88VYmMqA6a38O5DzfV2O
 AWoIZ/sO+UJqIw6hKhlcV8nBj/2NyIQLoAjgJeR2U2Y=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/9/19 10:20 PM, Jiunn Chang wrote:
> Add comment block documenting tests not included from section 13.15 of
> the HDMI CEC 1.4b specification.  This section outlines the System Audio
> Control feature.
> 
> Signed-off-by: Jiunn Chang <c0d1n61at3@gmail.com>
> ---
>  utils/cec-compliance/cec-test-audio.cpp | 30 +++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/utils/cec-compliance/cec-test-audio.cpp b/utils/cec-compliance/cec-test-audio.cpp
> index 2bc24daf..e0cdb9dc 100644
> --- a/utils/cec-compliance/cec-test-audio.cpp
> +++ b/utils/cec-compliance/cec-test-audio.cpp
> @@ -309,6 +309,36 @@ const unsigned arc_subtests_size = ARRAY_SIZE(arc_subtests);
>  
>  /* System Audio Control */
>  
> +/**

Just use /*. This doesn't have to end up in DocBook documentation.

> + * The following scenarios defined in section 13.15 of the HDMI CEC 1.4b
> + * specification are not currently tested:

Which of these tests require three CEC devices? That's a good reason for
not implementing the test. But I think some of these tests can be done if the
CEC adapter is configured as an Audio System, and you test against a TV.

> + *
> + * 1.  Amplifier initiated <System Audio Mode Request> and active source
> + *     discovery with a <Request Active Source> broadcast plus the
> + *     <Active Source> response.
> + * 2.  Post discovery, amplifier subsequent <Set System Audio Mode> [On]
> + *     and System Audio Control feature support confirmation with TV if
> + *     present.
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
> + * 8.  Optional features defined in subsection 13.15.4 of the HDMI CEC 1.4b
> + *     specifictation.

typo: specification

> + * 9.  <Request Audio Descriptor> message is new since HDMI CEC 1.4 so 1.3a
> + *     or earlier devices report <Feature Abort> for this feature.
> + * 10. <Report Audio Descriptor> message is new since HDMI CEC 1.4 so 1.3a
> + *     or earlier devices report <Feature Abort> for this feature.
> + * 11. System Audio Control is new since HDMI CEC 1.3a so 1.3 and earlier

1.3 -> 1.3a

> + *     devices report <Feature Abort> for this feature.
> + */
> +
>  static int sac_request_sad_probe(struct node *node, unsigned me, unsigned la, bool interactive)
>  {
>  	struct cec_msg msg = {};
> 

Regards,

	Hans
