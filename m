Return-Path: <linux-media+bounces-20802-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 797BF9BB57C
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 14:11:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A9DBD1C214D4
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 13:11:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB6701BBBFE;
	Mon,  4 Nov 2024 13:11:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FE01B85D0;
	Mon,  4 Nov 2024 13:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730725895; cv=none; b=OdAZnf4rdiSB4ZofntuOXpKnBNWy+xCmwvS94Rtx7A9l0nAcucSP2z0mDX+V4i7VANXau0QUmE1DHbovdwN01KKijoc4kBJ5GtEG3mpM98K5qCVTaHBsRfP7FR3yDtuuD3vKXgkc/HRXRySYbSVqi0m/jByDd8OOM9vhKyhRsC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730725895; c=relaxed/simple;
	bh=1lGdbN0LAG1e6Q5c4FNRN5slOOXeZ+qLxVNUBjrRd+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R5aRwV9yheH8MpdJew0K0AbQj1kYoeTFWeuxvNsxyLzj9Oi7gHfFxPrplFu9RUqsJHo4A4xO9bxb0moUWWqahuXaSzX0Ikps1cYuGndjVBoUJ3xDq4rrVyGY9aTkId+12ZiVGLRWOPzvi32GmbmWwcL9nChMHG8KLIuROYuqZYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
X-CSE-ConnectionGUID: WO6aDQOiQc2yu7uJOOwvSQ==
X-CSE-MsgGUID: tLqsduYSTYC6pRjhKeRJaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30273961"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30273961"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 05:11:34 -0800
X-CSE-ConnectionGUID: ZKnO8cPmTneh6IoeZNVc0Q==
X-CSE-MsgGUID: 9Z4hWyMjRiehbgR7F0LdHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; 
   d="scan'208";a="114437929"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 05:11:29 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy.shevchenko@gmail.com>)
	id 1t7wrc-0000000B4X5-32BK;
	Mon, 04 Nov 2024 15:11:24 +0200
Date: Mon, 4 Nov 2024 15:11:24 +0200
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jonathan Bergh <bergh.jonathan@gmail.com>,
	Roshan Khatri <topofeverest8848@gmail.com>,
	Dipendra Khadka <kdipendra88@gmail.com>,
	Sergio de Almeida Cipriano Junior <sergiosacj@riseup.net>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Kartik Kulkarni <kartik.koolks@gmail.com>,
	Kathara Sasikumar <katharasasikumar007@gmail.com>,
	Tchadel Icard <hello@tchadelicard.fr>, Kate Hsuan <hpa@redhat.com>,
	Colin Ian King <colin.i.king@gmail.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1 1/1] media: atomisp: Remove License information
 boilerplate
Message-ID: <ZyjH_FuBIvv2FEj_@smile.fi.intel.com>
References: <20240923105539.3569110-1-andriy.shevchenko@linux.intel.com>
 <28958f62-9051-45a6-a26d-585508e2bd11@redhat.com>
 <CAHp75VdscXFTB+mfUgKBnut3_idT88mas20ZsohSd6nrcVOnFA@mail.gmail.com>
 <c2dc7fa6-b455-4964-a1e7-555dd0c01916@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c2dc7fa6-b455-4964-a1e7-555dd0c01916@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Nov 04, 2024 at 01:51:40PM +0100, Hans de Goede wrote:
> On 4-Nov-24 1:30 PM, Andy Shevchenko wrote:
> > On Mon, Nov 4, 2024 at 1:57 PM Hans de Goede <hdegoede@redhat.com> wrote:
> >> On 23-Sep-24 12:53 PM, Andy Shevchenko wrote:
> >>> We have the respective SPDX identifiers that are already being applied
> >>> to the files in question. Remove the License information boilerplate.
> >>>
> >>> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> >>
> >> Thank you for your patch(es).
> > 
> > Thank you!
> > 
> > There is one patch (marked rft) left in the queue. Can you, please,
> > apply it locally to your branches which you use to test AtomISP with?
> > I'm talking about 20240923085652.3457117-1-andriy.shevchenko@linux.intel.com.
> 
> Yes I noticed that one myself too. But atm I'm at the co-working and
> I wanted to get the pull-req for 6.13 out the door (it already is
> a bit late and I hope it will still make it).

It's fine that change needs to be tested, better more than less testing.

> I have just added this to my personal repo and I'll try to give it
> a test spin soon.

Thank you!

-- 
With Best Regards,
Andy Shevchenko



