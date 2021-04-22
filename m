Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0DB8367A7C
	for <lists+linux-media@lfdr.de>; Thu, 22 Apr 2021 09:03:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234890AbhDVHDf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Apr 2021 03:03:35 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:55067 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231148AbhDVHDe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Apr 2021 03:03:34 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id ZTMWlpNSjvTEDZTMZlXqov; Thu, 22 Apr 2021 09:02:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1619074979; bh=7ycd27+QaNZU1JwfiY165HK6KI4u2hk8KNeDLCO2aQA=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=o5bf0XbybQ4pw7/3jK+2dNo7M6Ob1rIfd4C7WErqHaNBJktb+D4wVj01iBviBdhZH
         KgMNNdGI9isA+HFPkJUVQJK4AOgHfw46QlcbjZK8HAqj++D/XXckOw8F3M5nMBcrvP
         p4BheF7fPSw1oMC7pqJa2Oa/Tgg27nOVmEfxjk2QGF+9JHz6G2O0Zb8cVmbt/i+eIk
         JHk4mj5oDN8r6OXKIJ+B5awf+P6ADBFFa8OPzsbX1NNDmdGdz6iGVGVXpyCgiqJlJt
         jL0yL7L7Js9h4o7ms9iJzPqos0jmH/L1lnr2DiJh7mQK/TYvpev8CiSkMeJeqab2Ql
         aPivVbZqpUUnw==
Subject: Re: [PATCH v4 0/3] cec: add tests to Audio Rate Control
To:     Deborah Brouwer <deborahbrouwer3563@gmail.com>,
        linux-media@vger.kernel.org
References: <cover.1619060430.git.deborahbrouwer3563@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <bf312cbf-61a3-d809-be88-7b3ba318231c@xs4all.nl>
Date:   Thu, 22 Apr 2021 09:02:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <cover.1619060430.git.deborahbrouwer3563@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfGY9BOcpzC8I4VQbHp4+MCEODboz38PmwNszK2yVn9PvUgAe6bjHaB3bfMPLAz8Nfgd2fguY9H7sMUS8OqSBvejoQpkzVZS+yA6dfBCI6/Sz07lhvHtH
 gHzqYedBiU6P3o9uitnzGWFJPAbGTvikRMQ375bKBPs58ahlhs+NBIPmTQfQ1qYI3RR+pIoc/NmGXeI126uJ7aaPizBvy9PtKuAKS76BgdcS63ezczCRaihy
 R6Qx3TKikA4SVWbOqKr8mg==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Deb,

On 22/04/2021 05:27, Deborah Brouwer wrote:
> Update the Set Audio Rate test to include the Audio System source mask.
> Add an active sensing test.
> Add an invalid operand test.

Thank you for this patch series, it's been applied so you can mark this
Outreachy contribution as Accepted!

I have some follow-up comments for refinements (see my upcoming replies
to the corresponding patches), but those can be addressed in new patches.

Regards,

	Hans

> 
> Changes since v3:
> * Patch 1: cec-compliance: add Audio System mask to Set Audio Rate
> 	* New patch
> 
> * Patch 2: cec: add active sensing test for Audio Rate Control
> 	* Remove comments indicating basic and rudimentary status of test.
> 	* Add Audio System source mask to active sensing test.
> 
> * Patch 3: cec: add invalid operand test for Audio Rate Control messages
> 	* Replace "parameter" with "operand" in name, commit msg and comment.
> 	* Add Audio System source mask to invalid operand test.
> 
> Changes since v2:
> * Patch 1: cec: add active sensing test for Audio Rate Control
> 	* No changes.
> 
> * Patch 2: cec: add invalid parameter test for Audio Rate Control
> 	* Add indent to correct formatting error.
> 	* Change invalid parameter from -1 to 0xa.
> 	* Add check that message has not timed_out.
> 	* Add check that cec_msg_status_is_abort.
> 	* Add break at end of default case statement.
> 
> Changes since v1:
> * Patch 1: cec: add active sensing test for Audio Rate Control
> 	* remove or add spaces to conform to kernel coding style.
> 	* add empty line to improve readability.
> 	* add and clarify comments; remove TODO comment.
> 	* change commit subject to refer to "active sensing".
> 	* rename function to audio_rate_ctl_active_sensing.
> 	* rename node state to last_aud_rate_rx_ts.
> 	* make follower warning more specific.
> 	* change control flow in cec-processing to avoid extra indent.
> 
> Deborah Brouwer (3):
>   cec-compliance: add Audio System mask to Set Audio Rate
>   cec: add active sensing test for Audio Rate Control messages
>   cec: add invalid operand test for Audio Rate Control messages
> 
>  utils/cec-compliance/cec-test-audio.cpp | 62 +++++++++++++++++++++++--
>  utils/cec-follower/cec-follower.cpp     |  1 +
>  utils/cec-follower/cec-follower.h       |  1 +
>  utils/cec-follower/cec-processing.cpp   | 50 ++++++++++++++++----
>  4 files changed, 100 insertions(+), 14 deletions(-)
> 
> --
> 2.17.1
> 

