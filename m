Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EC8839B45A
	for <lists+linux-media@lfdr.de>; Fri,  4 Jun 2021 09:53:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230196AbhFDHzA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Jun 2021 03:55:00 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:60643 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230145AbhFDHzA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 4 Jun 2021 03:55:00 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id p4dilRWAahg8Zp4dllzr5a; Fri, 04 Jun 2021 09:53:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1622793193; bh=/pdh2RQOsWSUlNkYPjkWUGLFeQ+HjPYjqmui9HhJnaY=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=CjmKm9OMfJay7Fa8xGx6INFhPTbaN4MAVafMxpKIO1myKTHHJZj2/9I0HIVNksIfc
         WDP+QVgteV8DHC14nCMmegZ3AtyNowG5t5yReTqXisUX+FFosiHfrJSg6cO5zoWTC7
         pQgEcJkgv9RrYM9GEdo6PsLZBx0tiShh6YFU3973wGR4QtgSPCJMobDr3prqWQHNwo
         bsGm8l6LFuebfpk5ONj3YYclxmhG+YEl5ds0lX4svjmAb95uRaRlav+vkBfAfcPbKL
         hVnXKEnErAyPMdFc5fRm77CrgQUscsYXvAFHOr4utGP/YQnmIOwfcfLlypH2T654iB
         p92f+RbiNvRJQ==
Subject: Re: [PATCH v4 0/2] cec: add tests for Give Deck Status message
To:     Deborah Brouwer <deborahbrouwer3563@gmail.com>,
        linux-media@vger.kernel.org
Cc:     jaffe1@gmail.com
References: <cover.1622773904.git.deborahbrouwer3563@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <92b0c36a-22ab-708d-4e06-3d80db369f3b@xs4all.nl>
Date:   Fri, 4 Jun 2021 09:53:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <cover.1622773904.git.deborahbrouwer3563@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfGYSQbZhraOJNkBDokRkjZwXPzuxzuwkzG/spwrdxr7Lb6mp6vFt0Pkw1jWQuEZPHLS4bSZ6dfvC0FeJvuXRNO0X1DVME90sEKZyHDChz7Ta+YmWcPZ+
 NwMl448LzRXSy+gi2R4BJVBnDa9HJfbGsAMdGMUMDBU/3tkcwhiUMhklzMHgWsRToTuT9CeVLmfKBWi0A9GFSfGxg4lPQiubUitXOBhrAMj52fU8p7DOHp6T
 Edyjj2lcquOCQMOVEjgkpPd0u7yq6UaxHoOZGebGTuA=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Deb,

Thank you for your work, I've applied the patches.

One note for future patch series: the cover letter should also explain
a bit about what the patch series is about, not just the change
history. Something to keep in mind for the next patch series.

Regards,

	Hans

On 04/06/2021 04:40, Deborah Brouwer wrote:
> Changes since v3:
> 	Patch 1/2:
> 		- Remove the CEC Version checks and else block.
> 		- Add comment explaining why it works for CEC 1.4.
> 	Patch 2/2:
> 		- Keep/add empty line between variable declarations and code.
> 		- Remove restriction to playback or recording devices.
> 		- Extract the deck status where it was previously missed.
> 		- Extend comment to explain CEC_OP_STATUS_REQ_OFF test.
> 		- In the invalid test, remove redundant testing.
> 
> Changes since v2:
> 	Patch 1/2 cec-follower: emulate features for CEC versions < CEC 2.0
> 	* I already sent this as a single patch, and I have not made
> 		changes since then, I am just including it because now I
> 		need it for Patch 2/2 to apply.
> 
> 	Patch 2/2 cec: add tests for Give Deck Status message
> 	* Combine functions with same name "deck_ctl_give_status"
> 		to avoid confusion about the naming but also to avoid
> 		returning FAIL rather than using "fail_on_test" directly.
> 	* Expand the "Invalid Operand" test so that it will also test a
> 		follower running version < CEC 2.0.
> 	* Change the invalid operand from 0xaa to 0 and add a test for
> 		invalid operand "4", both just outside of the valid range.
> 	* Expand the "Invalid Operand" test to catch the other reasons
> 		for which a follower might Feature Abort (e.g. Unrecognized
> 		Op).
> 
> Changes since v1:
> 	* Remove unnecessary functions.
> 	* Revise function for turning Give Deck Status reporting On/Off.
> 	* Combine the Give Deck Status Reporting test into the first
> 	   Give Deck Status test.
> 
> Deborah Brouwer (2):
>   cec-follower: emulate features for CEC versions < CEC 2.0
>   cec: add tests for Give Deck Status message
> 
>  utils/cec-compliance/cec-test.cpp     | 72 ++++++++++++++++++++++-----
>  utils/cec-follower/cec-follower.cpp   | 44 +++++++++-------
>  utils/cec-follower/cec-follower.h     |  1 +
>  utils/cec-follower/cec-processing.cpp | 41 +++++++--------
>  utils/libcecutil/cec-info.cpp         |  2 -
>  5 files changed, 104 insertions(+), 56 deletions(-)
> 
> --
> 2.17.1
> 

