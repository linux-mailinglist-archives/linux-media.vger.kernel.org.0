Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FE92B76BA
	for <lists+linux-media@lfdr.de>; Thu, 19 Sep 2019 11:52:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389029AbfISJwY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Sep 2019 05:52:24 -0400
Received: from mga09.intel.com ([134.134.136.24]:53259 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388872AbfISJwY (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Sep 2019 05:52:24 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 19 Sep 2019 02:52:23 -0700
X-IronPort-AV: E=Sophos;i="5.64,523,1559545200"; 
   d="scan'208";a="177998612"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 19 Sep 2019 02:52:21 -0700
From:   Jani Nikula <jani.nikula@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        ksummit <ksummit-discuss@lists.linuxfoundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [Ksummit-discuss] [PATCH] media: add a subsystem profile documentation
In-Reply-To: <CAMuHMdWGhSNu-5U0B5WN6tMRQRaAeFgcN1b=pAcXZPUpSW-ehA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <156821693963.2951081.11214256396118531359.stgit@dwillia2-desk3.amr.corp.intel.com> <434c05bddd2b364e607e565227487910a8dd9793.1568391461.git.mchehab+samsung@kernel.org> <20190918123620.GA6306@pendragon.ideasonboard.com> <20190918105728.24e7eb48@coco.lan> <20190919065447.GF2959@kadam> <CAMuHMdU10J5zgQ0r8uoA+LFHRbyLB=AG6xygTmsxwc7T-ffdDw@mail.gmail.com> <87o8zgwu0m.fsf@intel.com> <CAMuHMdWGhSNu-5U0B5WN6tMRQRaAeFgcN1b=pAcXZPUpSW-ehA@mail.gmail.com>
Date:   Thu, 19 Sep 2019 12:52:18 +0300
Message-ID: <87lfukwr3h.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 19 Sep 2019, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> Hi Jani,
>
> On Thu, Sep 19, 2019 at 10:49 AM Jani Nikula <jani.nikula@intel.com> wrote:
>> On Thu, 19 Sep 2019, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>> > On Thu, Sep 19, 2019 at 8:57 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>> >> On Wed, Sep 18, 2019 at 10:57:28AM -0300, Mauro Carvalho Chehab wrote:
>> >> When I sent a patch, I use get_maintainer.pl then I add whoever the
>> >> wrote the commit from the Fixes tag.  Then I remove Colin King and Kees
>> >> Cook from the CC list because they worked all over the tree and I know
>> >> them.  I also normally remove LKML if there is another mailing list but
>> >> at least one subsystem uses LKML for patchwork so this isn't safe.
>> >>
>> >> So the safest instructions are "Use get_matainer.pl and add the person
>> >> who wrote the commit in the Fixes tag".
>> >
>> > Better: perhaps get_maintainer.pl can be taught to add the author of the
>> > commit pointed to by the Fixes tag, if present?
>>
>> The drm maintainer tools [1] have that, with Cc's and reviewers picked
>> up, and appropriate Cc: stable added. On a random commit from v5.3:
>
> Thanks, but that's not scripts/get_maintainer.pl, and restricted to one out
> of N subsystems.  Not so dissimilar from what Dan was complaining about.

The point was, perhaps poorly conveyed, to provide it as a reference,
and something to steal from. You can think of it as a wrapper around
get_maintainer.pl, it's really not subsystem specific, though part of
our scripts, and it'll take you all of five minutes to make it generic
from the source (MIT):

function dim_cite
{
	local sha1

	sha1=${1:?$usage}

	git --git-dir="$DIM_PREFIX/$DIM_REPO/.git" log -1 $sha1 \
	    "--pretty=format:%H (\"%s\")%n" | \
		sed -e 's/\([0-f]\{12\}\)[0-f]*/\1/'
}

function dim_fixes
{
	local sha1 tag

	sha1=${1:?$usage}

	cd $DIM_PREFIX/$DIM_REPO
	echo "Fixes: $(dim_cite $sha1)"

	(
		git show --no-patch $sha1 | \
			sed -e 's/\(Reviewed\|Acked\|Reported\|Signed\)[a-zA-Z-]*-by:/Cc:/' | \
			sed -e 's/^    C[Cc]: */Cc: /' | grep '^Cc: '
		git show $sha1 | scripts/get_maintainer.pl  --email --norolestats --pattern-depth 1 | sed -e "s/^/Cc: /"
	) | awk '!x[$0]++'

	tag=$(git tag --contains $sha1 | grep ^v | sort -V | head -n 1)
	if [[ -n "$tag" ]]; then
		if ! echo "$tag" | grep -q -e "-rc"; then
			echo "Cc: <stable@vger.kernel.org> # ${tag}+"
		fi
	fi
}


HTH,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
