Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17EF35955E0
	for <lists+linux-media@lfdr.de>; Tue, 16 Aug 2022 11:06:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232559AbiHPJG3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Aug 2022 05:06:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232285AbiHPJFw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Aug 2022 05:05:52 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7690552801;
        Tue, 16 Aug 2022 00:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1660634481; x=1692170481;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Lqi0pNBgvItIazaZwyQE/pVneghxzh7UK7w+HRaZ6+o=;
  b=LE88s7PkI4LJ3rqyyzvl/AcfqYXLmvj1ZZ8Uv/qguGDGsctOWNMSBCgd
   ojGAvsdvuCStY+FdNRZ10aaO/vHbIiXrkWxSprRymeBhJII96adTbTnvo
   3YutJalh2PPEZILKOXWJdabj3F4Ulipy/vZPm21C8rJkxy/niNjM6LRvB
   N9I0AsDxqv1NwDpP/lwlFAkeHH8Bm9BgkVqEMkPNkhVDzf7wkzyVkU5Tq
   wzwwrJx+ObnZincAvgW40976vt1My3KncIWvoT67tiayk0kJN6adzJ+0U
   diriuOAa9qarvDJaBMs+6DIPUcf0bqIfm7hGm9IoEa17fTC7HOWuYJxU+
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,240,1654552800"; 
   d="scan'208";a="25618933"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 16 Aug 2022 09:21:19 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 16 Aug 2022 09:21:19 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Tue, 16 Aug 2022 09:21:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1660634479; x=1692170479;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Lqi0pNBgvItIazaZwyQE/pVneghxzh7UK7w+HRaZ6+o=;
  b=e1tfLCeX7ra+BOfnMdlBYHbPuFt3brAh7jPfPnJF3MnAJSuHtB7ALytL
   jYTrrDXXKiXpCWHmCXb9fTvcf6+LezDYMqad+yuAWhmEg6yw35S4QhBJy
   3WGYpgb58nisor8Z3rztuUS6xHqiQfsY4grVOp36H1jeRVmABPUqTa6QD
   6gP+GXS38Dmv3gZV8AbAyw+DG0AXOIfco1fsA69I7R3MZu4C8qu23buuI
   1dhs/3Es4Om84Va+r4RmBeY3+eNoYl15P25OGpIkRoPVbmIgM4UIUQrWt
   +6rZcAzMrsbHHDtptShtZX0+uhfbfFPebKFokhdDKF+8SXvzUvkQi2gCV
   g==;
X-IronPort-AV: E=Sophos;i="5.93,240,1654552800"; 
   d="scan'208";a="25618932"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 16 Aug 2022 09:21:19 +0200
Received: from steina-w.localnet (unknown [10.123.49.11])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 7A1E4280056;
        Tue, 16 Aug 2022 09:21:19 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "Paul J . Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Naushir Patuck <naush@raspberrypi.com>
Subject: Re: [PATCH v4 3/7] media: i2c: ov9282: Add ov9281 compatible
Date:   Tue, 16 Aug 2022 09:21:17 +0200
Message-ID: <1983480.CQOukoFCf9@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <ceb2a42d-0650-6e6f-3408-6347bcd8c5e2@linaro.org>
References: <20220728130237.3396663-1-alexander.stein@ew.tq-group.com> <2403639.ElGaqSPkdT@steina-w> <ceb2a42d-0650-6e6f-3408-6347bcd8c5e2@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Dienstag, 16. August 2022, 09:16:44 CEST schrieb Krzysztof Kozlowski:
> On 15/08/2022 14:19, Alexander Stein wrote:
> > Hello,
> > 
> > Am Dienstag, 2. August 2022, 10:30:40 CEST schrieb Krzysztof Kozlowski:
> >> On 02/08/2022 10:23, Sakari Ailus wrote:
> >>> On Mon, Aug 01, 2022 at 08:08:58PM +0200, Krzysztof Kozlowski wrote:
> >>>> On 01/08/2022 20:07, Krzysztof Kozlowski wrote:
> >>>>> On 29/07/2022 10:18, Laurent Pinchart wrote:
> >>>>>> Hi Sakari,
> >>>>>> 
> >>>>>> (Adding Dave and Naush to the CC list)
> >>>>>> 
> >>>>>> On Fri, Jul 29, 2022 at 10:07:36AM +0300, Sakari Ailus wrote:
> >>>>>>> On Thu, Jul 28, 2022 at 03:13:11PM +0200, Krzysztof Kozlowski wrote:
> >>>>>>>> On 28/07/2022 15:02, Alexander Stein wrote:
> >>>>>>>>> According to product brief they are identical from software point
> >>>>>>>>> of
> >>>>>>>>> view.
> >>>>>>>>> Differences are a different chief ray angle (CRA) and the package.
> >>>>>>>>> 
> >>>>>>>>> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> >>>>>>>>> Acked-by: Daniele Alessandrelli <daniele.alessandrelli@intel.com>
> >>>>>>>>> ---
> >>>>>>>>> 
> >>>>>>>>>  drivers/media/i2c/ov9282.c | 1 +
> >>>>>>>>>  1 file changed, 1 insertion(+)
> >>>>>>>>> 
> >>>>>>>>> diff --git a/drivers/media/i2c/ov9282.c
> >>>>>>>>> b/drivers/media/i2c/ov9282.c
> >>>>>>>>> index 8a252bf3b59f..c8d83a29f9bb 100644
> >>>>>>>>> --- a/drivers/media/i2c/ov9282.c
> >>>>>>>>> +++ b/drivers/media/i2c/ov9282.c
> >>>>>>>>> @@ -1113,6 +1113,7 @@ static const struct dev_pm_ops ov9282_pm_ops
> >>>>>>>>> =
> >>>>>>>>> {
> >>>>>>>>> 
> >>>>>>>>>  };
> >>>>>>>>>  
> >>>>>>>>>  static const struct of_device_id ov9282_of_match[] = {
> >>>>>>>>> 
> >>>>>>>>> +	{ .compatible = "ovti,ov9281" },
> >>>>>>>> 
> >>>>>>>> The devices seem entirely compatible, so why you add a new
> >>>>>>>> compatible
> >>>>>>>> and not re-use existing?
> >>>>>>>> 
> >>>>>>>> The difference in lens does not explain this.
> >>>>>>> 
> >>>>>>> It is typically necessary to know what kind of related hardware can
> >>>>>>> be
> >>>>>>> found in the system, beyond just the device's register interface.
> >>>>>>> Apart
> >>>>>>> from USB cameras, less integrated cameras require low-level software
> >>>>>>> control in which specific device properties are important. In this
> >>>>>>> case it
> >>>>>>> could be the lens shading table, among other things.
> >>>>>>> 
> >>>>>>> 	https://www.ovt.com/sensor/ov9282/
> >>>>>>> 
> >>>>>>> Therefore I think adding a specific compatible string for this one
> >>>>>>> is
> >>>>>>> justified.
> >>>>> 
> >>>>> Specific compatible in binding is a requirement. No one discussed
> >>>>> this.
> >>>>> However not in the driver. None of the arguments above justify adding
> >>>>> such binding, unless user-space depends on matching compatible, but
> >>>>> not
> >>>>> real compatible?
> >>>> 
> >>>> Eh, now I used vague words. This should be instead:
> >>>> 
> >>>> "However not in the driver. None of the arguments above justify adding
> >>>> such compatible to driver, unless user-space depends on matching
> >>>> compatible, but not real compatible?"
> >>> 
> >>> If I understand you right, you'd put the more specific model name as
> >>> well
> >>> as the more generic one to the compatible property and let the driver
> >>> match
> >>> against the more generic one?
> >> 
> >> Yes.
> >> 
> >>> But in this case neither of these models is more generic than the other.
> >> 
> >> It's not a problem. Also the spec explains it similar way:
> >> "They
> >> 
> >>  allow a device to express its compatibility with a family of similar
> >> 
> >> devices, potentially allowing a single
> >> 
> >>  device driver to match against several devices."
> >> 
> >> Of course the numbers would suggest that ov9281 should be the family (as
> >> lower number usually means designed earlier), but it is a matter of
> >> convention which here can be skipped. The point is that ov9281 and
> >> ov9282 are compatible between each other, therefore they belong to
> >> single family.
> >> 
> >> Best regards,
> >> Krzysztof
> > 
> > So what is the conclusion of this?
> > If using the "family" name there is no way for userspace to see the actual
> > device name rather than the driver name. This might be confusing,
> > especially of both ov9281 and ov9282 are attached to the same platform.
> > The only difference would be the i2c-bus-address.
> > You can also go for ov928x but this is not a real improvement.
> 
> I still don't understand. Why user-space cannot see this? I really
> cannot find any trouble... Your 3/7 patch does nothing special here for
> user-space...

3/7 itself does nothing for userspace, but 6/7 does, which relies on separate 
compatibles in the driver.

Best regards,
Alexander



