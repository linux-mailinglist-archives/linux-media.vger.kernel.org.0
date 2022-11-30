Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6EAE63D6FF
	for <lists+linux-media@lfdr.de>; Wed, 30 Nov 2022 14:41:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231172AbiK3Nlp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Nov 2022 08:41:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231187AbiK3Nl2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Nov 2022 08:41:28 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08D90391C9;
        Wed, 30 Nov 2022 05:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669815688; x=1701351688;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QrUXfncXQanw0Mm6ZwDbZb3KG/pnQAYOneDEagGZU9Q=;
  b=iZsQnXG8al2ZgFdvsrZM3mjvb9f0oTXUFev/Oa0mTs0CJzX3MLukxYbR
   pwJGb9x/DTrWX35RQaizpn4C9X3rlT6AX3Eh4MCQlDtLkhFVQbQaW5MOF
   vYoF6HBm65QGS29KGJNgWhdcO8jacScxUkGxg1IWXGR/nyIb3SYG5UMj/
   iG7cD3y7LlEA7f20Xm8UZ7TI104WXYD+cbgc9bvkvcK9TSUwk0vlvMPrl
   VXIA35OAB9aB+zaYSueqxvm6emWRd8k+0IC1BQDtHUi6zxieVusXpPSUS
   pEBIn/TQqQMwrgSVNNQCjKy+mA8sefColv51gB5zO1bYS00rrnDYI/sL2
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="314088651"
X-IronPort-AV: E=Sophos;i="5.96,206,1665471600"; 
   d="scan'208";a="314088651"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2022 05:41:27 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="675028267"
X-IronPort-AV: E=Sophos;i="5.96,206,1665471600"; 
   d="scan'208";a="675028267"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2022 05:41:24 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 14CA3202B0;
        Wed, 30 Nov 2022 15:41:22 +0200 (EET)
Date:   Wed, 30 Nov 2022 13:41:22 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        platform-driver-x86@vger.kernel.org, Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 1/6] media: ov5693: Add support for a privacy-led GPIO
Message-ID: <Y4ddgnRbRyUDSPFI@paasikivi.fi.intel.com>
References: <20221129231149.697154-1-hdegoede@redhat.com>
 <20221129231149.697154-2-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221129231149.697154-2-hdegoede@redhat.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Wed, Nov 30, 2022 at 12:11:44AM +0100, Hans de Goede wrote:
> Add support for a privacy-led GPIO.
> 
> Making the privacy LED to controlable from userspace, as using the LED
> class subsystem would do, would make it too easy for spy-ware to disable
> the LED.
> 
> To avoid this have the sensor driver directly control the LED.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Note an additional advantage of directly controlling the GPIO is that
> GPIOs are tied directly to consumer devices. Where as with a LED class
> device, there would need to be some mechanism to tie the right LED
> (e.g front or back) to the right sensor.

Thanks for the patch.

This approach has the drawback that support needs to be added for each
sensor separately. Any idea how many sensor drivers might need this?

Most implementations have privacy LED hard-wired to the sensor's power
rails so it'll be lit whenever the sensor is powered on.

If there would be more than just a couple of these I'd instead create a LED
class device and hook it up to the sensor in V4L2.

-- 
Kind regards,

Sakari Ailus
