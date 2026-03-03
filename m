Return-Path: <linux-media+bounces-54276-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oHgDB1KgpmlqRwAAu9opvQ
	(envelope-from <linux-media+bounces-54276-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 09:48:18 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A71A41EB0AE
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 09:48:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DCA2A300F5A2
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2026 08:48:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21220388E6D;
	Tue,  3 Mar 2026 08:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bdJiuKDr"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5269E375F77;
	Tue,  3 Mar 2026 08:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772527694; cv=none; b=gfV+cUzxAz7iE8FlFSAVXr5eEkz91u3xyP/SZO6SumubCWQhEgFmPZ0UOO/tXv/x/cQ7+dSw1GM5Cy1IuRawawKmrx6m/JrgSfw5edrTQmX/+KiM2LnD/9mOhagc9O/i/d87PTmBMvuZlO/ftS9JFQxRM6l1qxp6ML0J8fQPak4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772527694; c=relaxed/simple;
	bh=8kK1pCNJVkBD644EbsB+J9DSrWpKdqlYxMh0oUoBXzA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PLJuwDKSt3zsNE3DWTSLVnb/f+wEpHzHyJhn57ueuIRVdZoH6fCjj55T+jwLjMTMPMY0neSBtqWBvcDRyW+DLuBYwy7xfa7+nuVX1rzDqJRRrhqF50Zh3Z5oLJcQkiMvrOZ3g/nValebMRXksqBoXpqLPPCfo7dKX5d4fUl+lG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bdJiuKDr; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6AAAD986;
	Tue,  3 Mar 2026 09:47:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1772527626;
	bh=8kK1pCNJVkBD644EbsB+J9DSrWpKdqlYxMh0oUoBXzA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bdJiuKDrCF4TI/dbm30OvDW4tiQ1hjP4Ko7C/vvJFS9MLLNRoJkKiutxJTKbF7zbo
	 0ZnIpkaRnYs6E3Ve5Ve0B5hd10c7YRIGmXfvGD8iVCRj6HsV6nI7B7gdrMu3wcyDEc
	 HWdti5b6VnyLcM6V0AwFJqLRypn+22GMWfKs5as0=
Date: Tue, 3 Mar 2026 09:48:04 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Antoine Bouyer <antoine.bouyer@nxp.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, julien.vuillaumier@nxp.com, alexi.birlinger@nxp.com, 
	daniel.baluta@nxp.com, peng.fan@nxp.com, frank.li@nxp.com, mchehab@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC v1 01/11] media: uapi: v4l2-isp: Add v4l2 ISP extensible
 statistics definitions
Message-ID: <aaacMySSCCIYvW3B@zed>
References: <20260123080938.3367348-1-antoine.bouyer@nxp.com>
 <20260123080938.3367348-2-antoine.bouyer@nxp.com>
 <aYIb8ZIZDfCJZEZ9@zed>
 <71b57f1c-be22-46a2-89a2-5abae11e0436@nxp.com>
 <aYNEtmJwnAtYitHO@zed>
 <20260209230036.GF2405149@killaraus.ideasonboard.com>
 <c5b5619e-d67b-4d80-8496-a5e326d239ae@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c5b5619e-d67b-4d80-8496-a5e326d239ae@nxp.com>
X-Rspamd-Queue-Id: A71A41EB0AE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54276-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[ideasonboard.com,nxp.com,kernel.org,pengutronix.de,gmail.com,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,ideasonboard.com:dkim]
X-Rspamd-Action: no action

Hello Antoine

On Mon, Mar 02, 2026 at 10:41:10AM +0100, Antoine Bouyer wrote:
> Hi Laurent, Jacopo
>
> On 2/10/26 12:00 AM, Laurent Pinchart wrote:
> >
> >
> > On Wed, Feb 04, 2026 at 02:14:50PM +0100, Jacopo Mondi wrote:
> > > On Wed, Feb 04, 2026 at 12:07:41PM +0100, Antoine Bouyer wrote:
> > > > On 2/3/26 5:15 PM, Jacopo Mondi wrote:
> > > > > On Fri, Jan 23, 2026 at 09:09:28AM +0100, Antoine Bouyer wrote:
> > > > > > Extend the v4l2-isp extensible format introduced for isp parameters buffer
> > > > > > to the statistics buffer as well.
> > > > > >
> > > > > > Like for ISP configuration purpose, that will help supporting various ISP
> > > > > > hardware versions reporting different statistics data with less impact on
> > > > > > userspace.
> > > > > >
> > > > > > The `v4l2_isp_stats_buffer` reuses the `v4l2_isp_params_buffer` container
> > > > > > definitions, with similar header, versions and flags. V0 and V1 versions
> > > > >
> > > > > Why do you need two flags ?
> > > > >
> > > > > Params had to introduce two because we had two drivers already
> > > > > mainlined using the pre-v4l2-isp version of extensible params which
> > > > > had defined their version identifier as 1 and 0 and we didn't want to
> > > > > break existing userspace using those identifiers. So we had to accept
> > > > > both V0 and V1 as "first version of the v4l2-isp extensible parameters
> > > > > format".
> > > > >
> > > > > For stats we don't have users, so I guess we can start with V1 == 0 ?
> > > >
> > > > I wanted to keep it aligned with params, so that any driver/userspace can
> > > > use the same API version value for both params and stats buffers, and limit
> > > > headache.
>
> Seems this topic is not yet clarified. Should I use same version values for
> both params and stats as in current patch ? Or use different values V1 == 0
> as suggested ?
>
> From userspace perspective, I feel it would be easier to align params and
> stats versions, so we don't need to maintain different versions for same
> purpose; and if a new version V2 comes and is applied to both params and
> stats buffers, then we can use same value too. What do you think ?

As the versioning is meant to identify the serialization format which
is the same for params and stats, ideally we should have the same
identifier both both.

However we can't simply remove enum v4l2_isp_version, to avoid
breaking userspace. What about

--- a/include/uapi/linux/media/v4l2-isp.h
+++ b/include/uapi/linux/media/v4l2-isp.h
@@ -13,25 +13,33 @@
 #include <linux/types.h>

 /**
- * enum v4l2_isp_params_version - V4L2 ISP parameters versioning
+ * enum v4l2_isp_version - V4L2 ISP serialization format versioning
  *
- * @V4L2_ISP_PARAMS_VERSION_V0: First version of the V4L2 ISP parameters format
- *                             (for compatibility)
- * @V4L2_ISP_PARAMS_VERSION_V1: First version of the V4L2 ISP parameters format
+ * @V4L2_ISP_VERSION_V0: First version of the V4L2 ISP serialization format
+ *                     (for compatibility)
+ * @V4L2_ISP_VERSION_V1: First version of the V4L2 ISP serialization format
  *
  * V0 and V1 are identical in order to support drivers compatible with the V4L2
- * ISP parameters format already upstreamed which use either 0 or 1 as their
- * versioning identifier. Both V0 and V1 refers to the first version of the
- * V4L2 ISP parameters format.
+ * ISP format already upstreamed which use either 0 or 1 as their versioning
+ * identifier. Both V0 and V1 refers to the first version of the V4L2 ISP
+ * serialization format.
  *
- * Future revisions of the V4L2 ISP parameters format should start from the
+ * Future revisions of the V4L2 ISP serialization format should start from the
  * value of 2.
  */
-enum v4l2_isp_params_version {
-       V4L2_ISP_PARAMS_VERSION_V0 = 0,
-       V4L2_ISP_PARAMS_VERSION_V1
+enum v4l2_isp_version {
+       V4L2_ISP_VERSION_V0 = 0,
+       V4L2_ISP_VERSION_V1
 };

+/*
+ * Compatibility with existing users of v4l2_isp_params which pre-date the
+ * introduction of v4l2_isp_stats.
+ */
+#define v4l2_isp_params_version        v4l2_isp_version
+#define V4L2_ISP_PARAMS_VERSION_V0     V4L2_ISP_VERSION_V0
+#define V4L2_ISP_PARAMS_VERSION_V1     V4L2_ISP_VERSION_V1
+
 #define V4L2_ISP_PARAMS_FL_BLOCK_DISABLE       (1U << 0)
 #define V4L2_ISP_PARAMS_FL_BLOCK_ENABLE                (1U << 1)

> > > >
> > > > > > are provided to match with params versions. On the other side, ENABLE and
> > > > > > DISABLE flags are not really meaningfull for statistics purpose. So VALID
> > > > > > and INVALID flags are introduced. Purpose is to force ISP driver to
> > > > > > validate a statistics buffer, before it is consumed by userspace.
> > > > >
> > > > > Interesting. What do you mean with "validate a statistics buffer" ?
> > > > > And if a driver has to do validation, why would it send upstream a
> > > > > non-validated buffer ?
> > > >
> > > > Like for version, I wanted to keep same header structure, including flags.
> > > > Since ENABLE/DISABLE is not relevant for statistics, I thought about using a
> > > > "validation" flag, to force driver confirming statistics blocks are valid or
> > > > not.
> > >
> > > See the question on the documentation patches.
> > >
> > > > If you feel it is useless, I'm fine with removing it. Should I keep a flag
> > > > field anyway to stay aligned with params then ?
> > >
> > > RkISP1 has support for both "legacy" and "extensible" formats because
> > > it has been mainline for a long time with the legacy format only. We
> > > couldn't simply replace the existing format with the new one because
> > > we would break existing users.
> > >
> > > All the other drivers that have been upstreamed with extensible only
> > > (Amlogic C3 and Mali C55) do not expose a legacy format as there was
> > > not prior version in mainline on which userspace might depend on.
> > >
> > > Unless you have very convincing reason, I would certainly drop the
> > > legacy format and only use extensible.
> >
> > I agree with that, for upstream we shouldn't carry legacy formats in new
> > drivers. I've read elsewhere in this thread that it won't cause issues,
> > otherwise I would have recommended carrying an extra patch in the BSP
> > kernel to implement legacy formats, and only use extensible formats
> > upstream.
>
> ok. I'm fine with removing legacy format from neo driver, and keep it only
> in downstream for some time.
>

Thank you!

> >
> > > > > > Signed-off-by: Antoine Bouyer <antoine.bouyer@nxp.com>
> > > > > > ---
> > > > > >    include/uapi/linux/media/v4l2-isp.h | 85 +++++++++++++++++++++++++++++
> > > > > >    1 file changed, 85 insertions(+)
> > > > > >
> > > > > > diff --git a/include/uapi/linux/media/v4l2-isp.h b/include/uapi/linux/media/v4l2-isp.h
> > > > > > index 779168f9058e..ed1279b86694 100644
> > > > > > --- a/include/uapi/linux/media/v4l2-isp.h
> > > > > > +++ b/include/uapi/linux/media/v4l2-isp.h
> > > > > > @@ -99,4 +99,89 @@ struct v4l2_isp_params_buffer {
> > > > > >         __u8 data[] __counted_by(data_size);
> > > > > >    };
> > > > > >
> > > > > > +/**
> > > > > > + * enum v4l2_isp_stats_version - V4L2 ISP statistics versioning
> > > > > > + *
> > > > > > + * @V4L2_ISP_STATS_VERSION_V0: First version of the V4L2 ISP statistics format
> > > > > > + *                          (for compatibility)
> > > > > > + * @V4L2_ISP_STATS_VERSION_V1: First version of the V4L2 ISP statistics format
> > > > > > + *
> > > > > > + * V0 and V1 are identical, and comply with V4l2 ISP parameters versions. So
> > > > > > + * both V0 and V1 refers to the first version of the V4L2 ISP statistics
> > > > > > + * format.
> > > > > > + *
> > > > > > + * Future revisions of the V4L2 ISP statistics format should start from the
> > > > > > + * value of 2.
> > > > > > + */
> > > > > > +enum v4l2_isp_stats_version {
> > > > > > +     V4L2_ISP_STATS_VERSION_V0 = 0,
> > > > > > +     V4L2_ISP_STATS_VERSION_V1,
> > > > >
> > > > > As suggested I would make V1 == 0
> > > > >
> > > > > > +};
> > > > > > +
> > > > > > +#define V4L2_ISP_PARAMS_FL_BLOCK_VALID               (1U << 0)
> > > > > > +#define V4L2_ISP_PARAMS_FL_BLOCK_INVALID     (1U << 1)
> > > > > > +
> > > > > > +/*
> > > > > > + * Reserve the first 8 bits for V4L2_ISP_STATS_FL_* flag.
> > > > > > + *
> > > > > > + * Driver-specific flags should be defined as:
> > > > > > + * #define DRIVER_SPECIFIC_FLAG0     ((1U << V4L2_ISP_STATS_FL_DRIVER_FLAGS(0))
> > > > > > + * #define DRIVER_SPECIFIC_FLAG1     ((1U << V4L2_ISP_STATS_FL_DRIVER_FLAGS(1))
> > > > > > + */
> > > > > > +#define V4L2_ISP_STATS_FL_DRIVER_FLAGS(n)       ((n) + 8)
> > > > >
> > > > > Currently we have no users of V4L2_ISP_PARAMS_FL_DRIVER_FLAGS so we
> > > > > could even consider making it a V4L2_ISP_FL_DRIVER_FLAGS
> > > > >
> > > > > Or do you think it is worth creating a new symbol ?
> > > >
> > > > To limit impact on potential on-going development, and future conflict,
> > > > creating new symbol may be safer IMO. But I'm fine with using a single
> > > > symbol if you prefer. Most probably this flag customization is not used yet
> > > > by any driver.
> > > >
> > > > > > +
> > > > > > +/**
> > > > > > + * struct v4l2_isp_stats_block_header - V4L2 extensible statistics block header
> > > > > > + * @type: The statistics block type (driver-specific)
> > > > > > + * @flags: A bitmask of block flags (driver-specific)
> > > > > > + * @size: Size (in bytes) of the statistics block, including this header
> > > > > > + *
> > > > > > + * This structure represents the common part of all the ISP statistics blocks.
> > > > > > + * Each statistics block shall embed an instance of this structure type as its
> > > > > > + * first member, followed by the block-specific statistics data.
> > > > > > + *
> > > > > > + * The @type field is an ISP driver-specific value that identifies the block
> > > > > > + * type. The @size field specifies the size of the parameters block.
> > > > > > + *
> > > > > > + * The @flags field is a bitmask of per-block flags V4L2_STATS_ISP_FL_* and
> > > > > > + * driver-specific flags specified by the driver header.
> > > > > > + */
> > > > > > +struct v4l2_isp_stats_block_header {
> > > > > > +     __u16 type;
> > > > > > +     __u16 flags;
> > > > > > +     __u32 size;
> > > > > > +} __attribute__((aligned(8)));
> > > > > > +
> > > > >
> > > > > This is currently identical to v4l2_isp_params_block_header.
> > > > >
> > > > > Can we create a single header for both stats and params and provide a
> > > > >
> > > > > #define v4l2_isp_params_block_header v4l2_isp_block_header
> > > > >
> > > > > for maintaining compatibility with existing users ?
> > > > >
> > > > > Or do you expect stats and params to eventually need different headers ?
> > > >
> > > > Current approach is to use same structure definitions as for params. So I'm
> > > > fine with creating a single header as suggested, and provide symbols to keep
> > > > compatibility.
> > > >
> > > > > > +/**
> > > > > > + * struct v4l2_isp_stats_buffer - V4L2 extensible statistics data
> > > > > > + * @version: The statistics buffer version (driver-specific)
> > > > > > + * @data_size: The statistics data effective size, excluding this header
> > > > > > + * @data: The statistics data
> > > > > > + *
> > > > > > + * This structure contains the statistics information of the ISP hardware,
> > > > > > + * serialized for userspace into a data buffer. Each statistics block is
> > > > > > + * represented by a block-specific structure which contains a
> > > > > > + * :c:type:`v4l2_isp_stats_block_header` entry as first member. Driver
> > > > > > + * populates the @data buffer with statistics information of the ISP blocks it
> > > > > > + * intends to share to userspace. As a consequence, the data buffer effective
> > > > > > + * size changes according to the number of ISP blocks that driver intends to
> > > > > > + * provide and is set by the driver in the @data_size field.
> > > > > > + *
> > > > > > + * The statistics buffer is versioned by the @version field to allow modifying
> > > > > > + * and extending its definition. Driver shall populate the @version field to
> > > > > > + * inform the userpsace about the version it intends to use. The userspace will
> > > > > > + * parse and handle the @data buffer according to the data layout specific to
> > > > > > + * the indicated version.
> > > > > > + *
> > > > > > + * For each ISP block that driver wants to report, a block-specific structure
> > > > > > + * is appended to the @data buffer, one after the other without gaps in
> > > > > > + * between. Driver shall populate the @data_size field with the effective
> > > > > > + * size, in bytes, of the @data buffer.
> > > > > > + */
> > > > > > +struct v4l2_isp_stats_buffer {
> > > > > > +     __u32 version;
> > > > > > +     __u32 data_size;
> > > > > > +     __u8 data[] __counted_by(data_size);
> > > > > > +};
> > > > > > +
> > > > >
> > > > > Same question. Should we introduce a struct v4l2_isp_buffer ?
> > > >
> > > > Yes, sounds reasonable.
> >
> > That seems to make sense. Once we'll have a driver using
> > v4l2_isp_stats_buffer the structure will become ABI. If it then is an
> > exact copy of v4l2_isp_params_buffer, it would make sense to unify them.
> > Let's see what will happen after a few review rounds, if we end up
> > requiring separate fields in the stats buffer header.
>
> ok to use same struct for both.
>
> >
> > It would also be nice to implement support for extensible stats in a
> > second driver to test the API.
>
> What is your preferred approach then ?
>
> Should I "split" v4l2_isp rework in different patchset BUT with another
> driver using it (with userspace changes I guess). Not something I'm really
> comfortable with since I only focused on i.MX95 isp so far. But if this is
> the only way, that could be evaluated.
>
> Or should I "keep" v4l2_isp changes together with neoisp introduction ?

It depends what you expect the timing for the next version of neoisp
to be.

However, to introduce new uAPI it is generally suggested to have at
least one user, so if time aligns I would keep the two together.

Thanks
  j

>
> Thanks
>
> Best regards
> Antoine
>
> >
> > > > > >    #endif /* _UAPI_V4L2_ISP_H_ */
> >
> > --
> > Regards,
> >
> > Laurent Pinchart
>

