Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 450647DEF4F
	for <lists+linux-media@lfdr.de>; Thu,  2 Nov 2023 10:58:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345746AbjKBJ6k (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Nov 2023 05:58:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229643AbjKBJ6j (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Nov 2023 05:58:39 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FF15112;
        Thu,  2 Nov 2023 02:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698919114; x=1730455114;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kFSdQcl2g68yKiL9ZrXJic/o/z6dETjZWO8hUFEwWDo=;
  b=OhjZFDiVLwbVyQUW+Lr/IzPgauu3J3aaJbTGFr28bM4PQVWgbfWzHttk
   i94LjbQz6vIwZXrKrWpNFtHB9nAelc+qLup1maQ08u4bSdQhJWofzKyUm
   j63ZHtVtHc0SmZfwOFQ6NfMo+WPQcQWKM7t3bnEzV4IGbS5IigugWrfRb
   VmRMxP5HNc31zZDUGiU4jZCfT9SABd2j7S+LvoxiO8Flq76oXKLLN+Rqz
   v4cNTigRpMMfeKiNmN6lS5bPANKJV/5ul+5bodhnwnvrCB5EyzwY5Ge1k
   PCK5pwdS4e2+sKTj1xb8tNiJpj0TIvpEZ5pOXpiI+elJZHlGB6+Sngtgx
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="455156957"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; 
   d="scan'208";a="455156957"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 02:58:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="764866785"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; 
   d="scan'208";a="764866785"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 02:58:31 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id A4D3112035D;
        Thu,  2 Nov 2023 11:58:28 +0200 (EET)
Date:   Thu, 2 Nov 2023 09:58:28 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-media@vger.kernel.org,
        Alain Volmat <alain.volmat@foss.st.com>, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] media: v4l2-cci: Add support for little-endian
 encoded registers
Message-ID: <ZUNyxOJMKjgaaQW7@kekkonen.localdomain>
References: <20231101122354.270453-1-alexander.stein@ew.tq-group.com>
 <20231102012217.GC5933@pendragon.ideasonboard.com>
 <ZUNCFESRnKMwkHl7@kekkonen.localdomain>
 <4980064.31r3eYUQgx@steina-w>
 <ZUNc-LRZiotD3OsK@kekkonen.localdomain>
 <597e7a7f-06e9-6f6f-2b27-1fa02ca046ad@redhat.com>
 <ZUNySNCX1O2Lk0iC@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZUNySNCX1O2Lk0iC@kekkonen.localdomain>
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Nov 02, 2023 at 09:56:24AM +0000, Sakari Ailus wrote:
> On Thu, Nov 02, 2023 at 10:27:45AM +0100, Hans de Goede wrote:
> > Hi,
> > 
> > On 11/2/23 09:25, Sakari Ailus wrote:
> > > Hi Alexander,
> > > 
> > > On Thu, Nov 02, 2023 at 08:51:12AM +0100, Alexander Stein wrote:
> > >> Hi,
> > >>
> > >> thanks for the feedback.
> > >>
> > >> Am Donnerstag, 2. November 2023, 07:30:44 CET schrieb Sakari Ailus:
> > >>> Hi Laurent,
> > >>>
> > >>> On Thu, Nov 02, 2023 at 03:22:17AM +0200, Laurent Pinchart wrote:
> > >>>> Hi Alexander,
> > >>>>
> > >>>> Thank you for the patch.
> > >>>>
> > >>>> On Wed, Nov 01, 2023 at 01:23:53PM +0100, Alexander Stein wrote:
> > >>>>> Some sensors, e.g. Sony, are using little-endian registers. Add support
> > >>>>> for
> > >>>>
> > >>>> I would write Sony IMX290 here, as there are Sony sensors that use big
> > >>>> endian.
> > >>>
> > >>> Almost all of them. There are a few exceptions indeed. This seems to be a
> > >>> bug.
> > >>
> > >> Let's name IMX290 here as an actual example. No need to worry about other 
> > >> models here.
> > >>
> > >>>>> those by encoding the endianess into Bit 20 of the register address.
> > >>>>>
> > >>>>> Fixes: af73323b97702 ("media: imx290: Convert to new CCI register access
> > >>>>> helpers") Cc: stable@vger.kernel.org
> > >>>>> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > >>>>> ---
> > >>>>>
> > >>>>>  drivers/media/v4l2-core/v4l2-cci.c | 44 ++++++++++++++++++++++++------
> > >>>>>  include/media/v4l2-cci.h           |  5 ++++
> > >>>>>  2 files changed, 41 insertions(+), 8 deletions(-)
> > >>>>>
> > >>>>> diff --git a/drivers/media/v4l2-core/v4l2-cci.c
> > >>>>> b/drivers/media/v4l2-core/v4l2-cci.c index bc2dbec019b04..673637b67bf67
> > >>>>> 100644
> > >>>>> --- a/drivers/media/v4l2-core/v4l2-cci.c
> > >>>>> +++ b/drivers/media/v4l2-core/v4l2-cci.c
> > >>>>> @@ -18,6 +18,7 @@
> > >>>>>
> > >>>>>  int cci_read(struct regmap *map, u32 reg, u64 *val, int *err)
> > >>>>>  {
> > >>>>>
> > >>>>> +	bool little_endian;
> > >>>>>
> > >>>>>  	unsigned int len;
> > >>>>>  	u8 buf[8];
> > >>>>>  	int ret;
> > >>>>>
> > >>>>> @@ -25,6 +26,7 @@ int cci_read(struct regmap *map, u32 reg, u64 *val,
> > >>>>> int *err)> > 
> > >>>>>  	if (err && *err)
> > >>>>>  	
> > >>>>>  		return *err;
> > >>>>>
> > >>>>> +	little_endian = reg & CCI_REG_LE;
> > >>>>
> > >>>> You could initialize the variable when declaring it. Same below.
> > >>>
> > >>> I was thinking of the same, but then it'd be logical to move initialisation
> > >>> of all related variables there. reg is modified here though. I'd keep
> > >>> setting little_endian here. If someone wants to move it, that could be done
> > >>> in a separate patch.
> > >>>
> > >>>>>  	len = FIELD_GET(CCI_REG_WIDTH_MASK, reg);
> > >>>>>  	reg = FIELD_GET(CCI_REG_ADDR_MASK, reg);
> > >>>>>
> > >>>>> @@ -40,16 +42,28 @@ int cci_read(struct regmap *map, u32 reg, u64 *val,
> > >>>>> int *err)> > 
> > >>>>>  		*val = buf[0];
> > >>>>>  		break;
> > >>>>>  	
> > >>>>>  	case 2:
> > >>>>> -		*val = get_unaligned_be16(buf);
> > >>>>> +		if (little_endian)
> > >>>>> +			*val = get_unaligned_le16(buf);
> > >>>>> +		else
> > >>>>> +			*val = get_unaligned_be16(buf);
> > >>>>
> > >>>> Unrelated to this patch, isn't buf aligned to a 4 bytes boundary ?
> > >>>
> > >>> Very probably, as it's right after len that's an unsigned int. Adding
> > >>> __aligned(8) would ensure we don't need any of the unaligned variants, and
> > >>> most likely would keep the stack layout as-is.
> > >>
> > >> You mean something like this?
> > >>
> > >> u8 __aligned(8) buf[8];
> > >> [...]
> > >> if (little_endian)
> > >> 	*val = le64_to_cpup(buf);
> > >> else
> > >> 	*val = be64_to_cpup(buf);
> > >>
> > >> But what about 24 Bits? There is no le24_to_cpup. I would rather use the same 
> > >> API for all cases.
> > > 
> > > The aligned APIs are much better choice when you can use them. The 24 bit
> > > case can remain special IMO.
> > > 
> > >>
> > >>> Or... how about putting it in an union with a u64? That would mean it's
> > >>> accessible as u64 alignment-wise while the alignment itself is up to the
> > >>> ABI. A comment would be good to have probably.
> > >>
> > >> An additional union seems a bit too much here. Unless something suitable 
> > >> already exists for general usage.
> > > 
> > > I think it's nicer than using __aligned() as you get ABI alignment that
> > > way, not something you force manually --- that's a bit crude.
> > > 
> > > I wonder that others think.
> > 
> > I'm fine with adding the __aligned(8) and switching the non 24 bit
> > cases to helpers which assume alignment. The most important note
> > I have is that that is a separate improvement from this series though.
> > 
> > So this should be done in a follow-up patch which is not Cc: stable .
> 
> I'm fine with that.
> 
> So I think these are good as-is then.

Or rather with the non-functional changes made in v3.

-- 
Sakari Ailus
