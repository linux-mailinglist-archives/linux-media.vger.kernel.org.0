Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4CFA8DCF83
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2019 21:44:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437671AbfJRToA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Oct 2019 15:44:00 -0400
Received: from mga01.intel.com ([192.55.52.88]:51494 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2394892AbfJRToA (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Oct 2019 15:44:00 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Oct 2019 12:43:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,312,1566889200"; 
   d="scan'208";a="199809708"
Received: from wittejoe-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.249.39.3])
  by orsmga003.jf.intel.com with ESMTP; 18 Oct 2019 12:43:56 -0700
Received: by kekkonen.fi.intel.com (Postfix, from userid 1000)
        id 09CD821E76; Fri, 18 Oct 2019 22:40:33 +0300 (EEST)
Date:   Fri, 18 Oct 2019 22:40:33 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tfiga@google.com, pavel@ucw.cz,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 01/11] dt-bindings: video-interfaces: Document
 'location' property
Message-ID: <20191018194033.GF3712@kekkonen.localdomain>
References: <20191007162913.250743-1-jacopo@jmondi.org>
 <20191007162913.250743-2-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191007162913.250743-2-jacopo@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

(Cc'ing the devicetree list.)

On Mon, Oct 07, 2019 at 06:29:03PM +0200, Jacopo Mondi wrote:
> Add the 'location' device property, used to specify a device mounting
> position. The property is particularly meaningful for mobile devices
> with a well defined usage orientation.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  .../devicetree/bindings/media/video-interfaces.txt    | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/video-interfaces.txt b/Documentation/devicetree/bindings/media/video-interfaces.txt
> index f884ada0bffc..1211bdf80722 100644
> --- a/Documentation/devicetree/bindings/media/video-interfaces.txt
> +++ b/Documentation/devicetree/bindings/media/video-interfaces.txt
> @@ -89,6 +89,17 @@ Optional properties
>    but a number of degrees counter clockwise. Typical values are 0 and 180
>    (upside down).
>  
> +- location: The mount location of a device (typically an image sensor or a flash
> +  LED) expressed as a position relative to the usage orientation of the system
> +  where the device is installed on.
> +  Possible values are:
> +  0 - Front. The device is mounted on the front facing side of the system.

How about starting from 1? Then 0 can remain "undefined" value, i.e. the
caller can initialise the value to zero without the need to figure out
whether reading a given property was successful or not.

> +  For mobile devices such as smartphones, tablets and laptops the front side is
> +  the user facing side.
> +  1 - Back. The device is mounted on the back side of the system, which is
> +  defined as the opposite side of the front facing one.
> +  2 - External. The device is not attached directly to the system but is
> +  attached in a way that allows it to move freely.
>  
>  Optional endpoint properties
>  ----------------------------

-- 
Sakari Ailus
sakari.ailus@linux.intel.com
