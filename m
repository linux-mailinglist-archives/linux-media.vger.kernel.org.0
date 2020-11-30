Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2CA12C82B9
	for <lists+linux-media@lfdr.de>; Mon, 30 Nov 2020 12:00:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726158AbgK3K7v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Nov 2020 05:59:51 -0500
Received: from mga05.intel.com ([192.55.52.43]:42699 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725902AbgK3K7v (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Nov 2020 05:59:51 -0500
IronPort-SDR: GvVPByKf8K3jaHJxfV5YemHL0z6gF9Tk0XHZjyz0udFjSFcyG2epY2LXRdWuWD9UJvhL9WFzYm
 CDL5J8xcYUGA==
X-IronPort-AV: E=McAfee;i="6000,8403,9820"; a="257323531"
X-IronPort-AV: E=Sophos;i="5.78,381,1599548400"; 
   d="scan'208";a="257323531"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2020 02:58:10 -0800
IronPort-SDR: PEgyR8oCbYwXxoE8fHTfNc0a0vm7YOTOFUh+RITcq9d+Juo3vh0LMuB8g4j/8M6N0AdsUnLSv0
 +FFs/VFcWIBw==
X-IronPort-AV: E=Sophos;i="5.78,381,1599548400"; 
   d="scan'208";a="549051814"
Received: from mkrastex-mobl.ger.corp.intel.com (HELO mkrastexMOBL) ([10.104.71.12])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2020 02:58:08 -0800
From:   <martinax.krasteva@linux.intel.com>
To:     "'Rob Herring'" <robh@kernel.org>
Cc:     <linux-media@vger.kernel.org>, <robh+dt@kernel.org>,
        <mchehab@kernel.org>, <devicetree@vger.kernel.org>,
        <daniele.alessandrelli@linux.intel.com>,
        <gjorgjix.rosikopulos@linux.intel.com>,
        <sakari.ailus@linux.intel.com>
References: <20201120142803.308-1-martinax.krasteva@linux.intel.com> <20201120142803.308-2-martinax.krasteva@linux.intel.com> <20201120205858.GA1722419@robh.at.kernel.org>
In-Reply-To: <20201120205858.GA1722419@robh.at.kernel.org>
Subject: RE: [PATCH 1/2] dt-bindings: media: Add bindings for imx334
Date:   Mon, 30 Nov 2020 10:58:05 -0000
Message-ID: <002101d6c707$b103c0c0$130b4240$@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGUhaCwHgQDECFXL9iGIzaOw1hzuAG/OI4XAeunsPKqR6xxoA==
Content-Language: en-us
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rob,

> -----Original Message-----
> From: Rob Herring <robh@kernel.org>
> Sent: Friday, November 20, 2020 8:59 PM
> To: Martina Krasteva <martinax.krasteva@linux.intel.com>
> Cc: linux-media@vger.kernel.org; robh+dt@kernel.org; mchehab@kernel.org;
> devicetree@vger.kernel.org; daniele.alessandrelli@linux.intel.com;
> gjorgjix.rosikopulos@linux.intel.com; sakari.ailus@linux.intel.com
> Subject: Re: [PATCH 1/2] dt-bindings: media: Add bindings for imx334
> 
> On Fri, 20 Nov 2020 14:28:02 +0000, Martina Krasteva wrote:
> > From: Martina Krasteva <martinax.krasteva@intel.com>
> >
> > - Add dt-bindings documentation for Sony imx334 sensor driver.
> > - Add MAINTAINERS entry for Sony imx334 binding documentation.
> >
> > Signed-off-by: Martina Krasteva <martinax.krasteva@intel.com>
> > Reviewed-by: Gjorgji Rosikopulos <gjorgjix.rosikopulos@intel.com>
> > Acked-by: Daniele Alessandrelli <daniele.alessandrelli@intel.com>
> > ---
> >  .../devicetree/bindings/media/i2c/sony,imx334.yaml | 59
> ++++++++++++++++++++++
> >  MAINTAINERS                                        |  7 +++
> >  2 files changed, 66 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml
> >
> 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> ./Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml:34:15:
> [warning] wrong indentation: expected 12 but found 14 (indentation)
> ./Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml:36:15:
> [warning] wrong indentation: expected 12 but found 14 (indentation)
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml:
> 'additionalProperties' is a required property
> /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml:
> ignoring, error in schema:
> warning: no schema found in file:
> ./Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml
> 
> 
> See https://patchwork.ozlabs.org/patch/1403740
> 
> The base for the patch is generally the last rc1. Any dependencies should
be
> noted.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
error(s),
> then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit.

Thank you, I will fix these warnings in the next version

Best Regards,
Martina

