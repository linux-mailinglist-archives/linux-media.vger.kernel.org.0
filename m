Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C236B8E51C
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2019 08:57:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730220AbfHOG5o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Aug 2019 02:57:44 -0400
Received: from mga05.intel.com ([192.55.52.43]:42097 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729838AbfHOG5o (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Aug 2019 02:57:44 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 14 Aug 2019 23:57:43 -0700
X-IronPort-AV: E=Sophos;i="5.64,388,1559545200"; 
   d="scan'208";a="201126314"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 14 Aug 2019 23:57:42 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 7EAB32069D; Thu, 15 Aug 2019 09:56:35 +0300 (EEST)
Date:   Thu, 15 Aug 2019 09:56:35 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org
Subject: Re: [RFC 1/5] media: dt-bindings: Document 'location' property
Message-ID: <20190815065635.GJ6133@paasikivi.fi.intel.com>
References: <20190814202815.32491-1-jacopo@jmondi.org>
 <20190814202815.32491-2-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190814202815.32491-2-jacopo@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Wed, Aug 14, 2019 at 10:28:11PM +0200, Jacopo Mondi wrote:
> Add the 'location' device property, used to specify the camera device
> mounting position. The property is particularly meaningful for mobile
> devices with a well defined usage orientation.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  Documentation/devicetree/bindings/media/video-interfaces.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/video-interfaces.txt b/Documentation/devicetree/bindings/media/video-interfaces.txt
> index f884ada0bffc..819077b2649c 100644
> --- a/Documentation/devicetree/bindings/media/video-interfaces.txt
> +++ b/Documentation/devicetree/bindings/media/video-interfaces.txt
> @@ -89,6 +89,10 @@ Optional properties
>    but a number of degrees counter clockwise. Typical values are 0 and 180
>    (upside down).
> 
> +- location: The camera device mounting position, relative to the device
> +  usage orientation. Possible values are:
> +  0 - Front camera. The image sensor is mounted on the front side of the device.
> +  1 - Back camera. The image sensor is mounted on the back side of the device.

Would it make sense to make this a little more generic? Such as s/image
sensor/ device/, for instance?

Is this also relevant for flash or lens devices?

Flash (torch) devices could be present, at least principle, without a
camera. There once was even such a Nokia phone, 1100 unless I'm mistaken.
:-)

-- 
Regards,

Sakari Ailus
sakari.ailus@linux.intel.com
