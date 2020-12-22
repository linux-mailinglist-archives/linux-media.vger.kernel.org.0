Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 191452E084E
	for <lists+linux-media@lfdr.de>; Tue, 22 Dec 2020 10:52:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725902AbgLVJwR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Dec 2020 04:52:17 -0500
Received: from mga05.intel.com ([192.55.52.43]:55542 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725882AbgLVJwQ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Dec 2020 04:52:16 -0500
IronPort-SDR: MwUwi75+4LgsjoRmeJctTzYt3I3wstXdFgVp2tns19x0kKGH4vZmQN09VuNkq1+ablHlXJYM8l
 xntOHvmsH4BA==
X-IronPort-AV: E=McAfee;i="6000,8403,9842"; a="260577725"
X-IronPort-AV: E=Sophos;i="5.78,438,1599548400"; 
   d="scan'208";a="260577725"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2020 01:50:31 -0800
IronPort-SDR: ovolfUZd7g0I5TH1koGfrqeCsD99J5sb2jk1fKkCOo9qgc8DNQKEmeyrFYu4PMPWZekwMQGhZb
 cKsggLVX0JBQ==
X-IronPort-AV: E=Sophos;i="5.78,438,1599548400"; 
   d="scan'208";a="416400281"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2020 01:50:28 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 20A9E205FC; Tue, 22 Dec 2020 11:50:26 +0200 (EET)
Date:   Tue, 22 Dec 2020 11:50:26 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        roman.kovalivskyi@globallogic.com,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        naush@raspberrypi.com, Eugeniu Rosca <erosca@de.adit-jv.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v4 01/30] dt-bindings: media: i2c: Rename ov5647.yaml
Message-ID: <20201222095025.GS26370@paasikivi.fi.intel.com>
References: <20201119161956.756455-1-jacopo@jmondi.org>
 <20201119161956.756455-2-jacopo@jmondi.org>
 <20201125091526.GI3940@paasikivi.fi.intel.com>
 <CAL_JsqLfdGumeicqqhkfn5K40GaXX93NuNZTOpgcCLycHmVQbg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqLfdGumeicqqhkfn5K40GaXX93NuNZTOpgcCLycHmVQbg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rob,

On Mon, Dec 21, 2020 at 01:23:29PM -0700, Rob Herring wrote:
> On Wed, Nov 25, 2020 at 2:15 AM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> >
> > Cc Rob + DT list.
> 
> You have to resend if you really want me to see things. In this case,
> I don't think you need to wait on me for a rename.

I merged the patch earlier based on the IRC discussion.

-- 
Regards,

Sakari Ailus
