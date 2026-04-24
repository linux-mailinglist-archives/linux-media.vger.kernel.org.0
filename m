Return-Path: <linux-media+bounces-59534-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GH4GLPd362npNAAAu9opvQ
	(envelope-from <linux-media+bounces-59534-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 16:02:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1DD45FF20
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 16:02:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 88AF93005320
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 14:02:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A834E3DB652;
	Fri, 24 Apr 2026 14:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="eVrbBPSa"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D1A3845CB;
	Fri, 24 Apr 2026 14:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777039343; cv=none; b=QwqGNvsoSkUbh19EmdDdmaeoYvUoiFqmJalbYArGGi1ky/NKHmOFA5XpmrNn20EgTLQXs0O4ue+OccyvgLDTEll0zbWjxD/40o4wlMHkjI/mFjcRvb6H1PMqm+nfw25nejI88ZBRZeWNQ4uEGTrcskgIlmNwYuzwkGldAWI1mj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777039343; c=relaxed/simple;
	bh=ack7mYbip6ZcuORQPpGdCVHFIO+2WE0qOIuDR99tjcI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sRoOebb+MrJ65ce4GV1vlcQOxqpjMMYEex+ohRjF59lHBiYNqKWetpbbNSIUlPv+gONPHAXDBQqsS2m63cSsxFnD56Zfh1qFcM3ba/54O9Ogj3/YxVYnmP0q1SNU1fBS7HbvC4abiRkLgDVyXm5kYHm3re82Qpg3Sp0zSXleqGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=eVrbBPSa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 300E0C19425;
	Fri, 24 Apr 2026 14:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777039342;
	bh=ack7mYbip6ZcuORQPpGdCVHFIO+2WE0qOIuDR99tjcI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eVrbBPSay5lsKqpmLH1QRqkLYOnAbpPXdwffDswEX5wCx3OM8YNgFVoAszeWet41J
	 N7en7QHUFyw55uVogTj/9asNhK9JcorV9woWHwY6p95kzbYb9NwfRCbUQ+iccUgFGa
	 1atSKUuBQu1QGh/D5JqOoasZsOzablfgD/xYZz5k=
Date: Fri, 24 Apr 2026 15:34:38 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Stefan Schmidt <stefan.schmidt@linaro.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jonathan Hunter <jonathanh@nvidia.com>, linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	driver-core@lists.linux.dev, dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v2 02/13] drivers: base: Add generic dma context bus
Message-ID: <2026042442-luxurious-antonym-f20c@gregkh>
References: <20260423-glymur-v2-0-0296bccb9f4e@oss.qualcomm.com>
 <20260423-glymur-v2-2-0296bccb9f4e@oss.qualcomm.com>
 <2026042346-trustable-register-095a@gregkh>
 <06c04947-e72e-679b-493b-e112d693f391@oss.qualcomm.com>
 <2026042422-deem-chemist-8d0f@gregkh>
 <4c3fa710-f61a-4aad-622d-54909190cb9e@oss.qualcomm.com>
 <2026042428-blemish-helpline-7d8d@gregkh>
 <1e039dd5-da3f-19b2-ef98-29e64fdd925d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1e039dd5-da3f-19b2-ef98-29e64fdd925d@oss.qualcomm.com>
X-Rspamd-Queue-Id: 0D1DD45FF20
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59534-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[33];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linux.dev,8bytes.org,arm.com,linaro.org,nvidia.com,gmail.com,ffwll.ch,vger.kernel.org,lists.linux.dev,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linuxfoundation.org:dkim]

On Fri, Apr 24, 2026 at 06:12:09PM +0530, Vishnu Reddy wrote:
> 
> On 4/24/2026 5:25 PM, Greg Kroah-Hartman wrote:
> > On Fri, Apr 24, 2026 at 05:15:02PM +0530, Vishnu Reddy wrote:
> >> On 4/24/2026 4:43 PM, Greg Kroah-Hartman wrote:
> >>> On Fri, Apr 24, 2026 at 04:01:13PM +0530, Vishnu Reddy wrote:
> >>>> On 4/23/2026 7:07 PM, Greg Kroah-Hartman wrote:
> >>>>> On Thu, Apr 23, 2026 at 06:59:31PM +0530, Vishnu Reddy wrote:
> >>>>>> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> >>>>>>
> >>>>>> When a driver needs to create virtual device at runtime and map it to
> >>>>>> an IOMMU context for memory isolation, there is no common bus available
> >>>>>> for this purpose. Each driver ends up implementing its own bus type,
> >>>>>> leading to duplicated logic across multiple drivers.
> >>>>>>
> >>>>>> host1x driver implemented its own bus type to attach an IOMMU context to
> >>>>>> a dynamically created device. The Iris VPU driver now has the same
> >>>>>> requirement. Rather than duplicating the same bus logic again, a shared
> >>>>>> bus type is introduced under drivers/base that multiple drivers can use
> >>>>>> directly.
> >>>>>>
> >>>>>> The bus takes care of creating a device and attaching the IOMMU context
> >>>>>> to it based on the client inputs.
> >>>>>>
> >>>>>> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >>>>>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> >>>>>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> >>>>>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> >>>>>> ---
> >>>>>>  drivers/base/Kconfig            |  3 ++
> >>>>>>  drivers/base/Makefile           |  1 +
> >>>>>>  drivers/base/dma_context_bus.c  | 77 +++++++++++++++++++++++++++++++++++++++++
> >>>>>>  include/linux/dma_context_bus.h | 26 ++++++++++++++
> >>>>>>  4 files changed, 107 insertions(+)
> >>>>> as you can not have a device on multiple busses at the same time, this
> >>>>> makes no sense to me at all.  "dma context" is a bus-specific thing, so
> >>>>> please add it to the bus that you are wanting it for.  It can't be a
> >>>>> generic bus as that just doesn't work.
> >>>>>
> >>>>> Or what am I missing here?
> >>>>>
> >>>>> And why is DMA somehow "special" here from any other hardware attribute?
> >>>> Let me give brief information which was discussed, in the initial series,
> >>>> the iris VPU used platform bus for dynamically created devices and we got
> >>>> the comment/suggestion from Robin to implement a proper bus_type with a
> >>>> .dma_configure callback.
> >>>>
> >>>> https://lore.kernel.org/all/02b3d0f5-f94c-43cd-93af-97cfcf7751b1@arm.com/
> >>>>
> >>>> based on the discussion, implemented the dma_context_bus and used for iris
> >>>> VPU devices instead of platform bus.
> >>> Why not make a irus_vpu_bus where you can do what you want?
> >> Initially iris_vpu_bus was introduced, and it was made generic based on the
> >> discussion,
> >>
> >> https://lore.kernel.org/all/20260227-kaanapali-iris-v2-3-850043ac3933@oss.qualcomm.com/
> > I don't really see that request here, I see a "make this better and more
> > generic for other busses" but that does not mean "dump it into
> > drivers/bus/ for someone else to maintain" :)
> >
> >>>> Here, the device have only one bus (dma_context_bus), not multiple buses.
> >>>>
> >>>> Regarding the "DMA" naming, the core operation of this bus is its
> >>>> .dma_configure callback, which calls of_dma_configure_id() to map the device
> >>>> to a corresponding IOMMU stream ID. The name "dma_context" reflects this
> >>>> purpose.
> >>>>
> >>>> I am open to suggestions from you or Robin or anyone else, if there is a
> >>>> better or preferred way to achieve this, I am happy to consider it and
> >>>> rework the implementation accordingly.
> >>> As there is only one user, just make this your own bus please and do all
> >>> of the needed bus operations for your devices there (i.e. don't hang an
> >>> "empty" device off of it.)
> >> The reasoning behind to make it generic was to have more users - host1x,
> >> Iris VPU, QDA on the generic context bus, instead of each of them having
> >> their own. Let me know if you suggest to have the iris_vpu_bus.
> > But you did not add such users here, so how would we know this?
> >
> > And still, I have no idea what this bus really is doing.  Is it dynamic?
> > Is it self-describing?  Why not just use aux-bus?  What is it supposed
> > to be doing and used for?
> 
> This bus will allow users to create a dynamic device and map to IOMMU stream
> ID via .dma_configure callback which calls the of_dma_confgure_id() based on
> the user inputs. This bus is under the iommu_buses list to register for bus
> notifier callbacks for iommu_probe_device() and iommu_release_device() during
> add and remove.

But a device is nothing on its own.  You can not just have a random
'struct device' hanging out there that does nothing but iommu, right?
It should be doing something else that is very "bus" specific.

Again, why not create a bus for your hardware type and have that control
the bindings of drivers to the devices, like it should be done.  You
better not be creating platform devices for these things :)

> auxilary bus don't have the .dma_callback and bus notifier callbacks where it
> can do iommu_probe_device() and iommu_release_device(). iommu_release_device(),
> being a static api, need to be called from bus notifier callbacks which should
> be under the list of iommu_buses.

True, because aux bus devices don't do that directly, they are "sharing"
resources with their parent device and something has to mediate for it.
So yes, you are right, that is not a good idea.  Make a custom bus type
instead please.

thanks,

greg k-h

