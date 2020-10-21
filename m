Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2ADC8294D27
	for <lists+linux-media@lfdr.de>; Wed, 21 Oct 2020 15:01:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2442790AbgJUNBG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Oct 2020 09:01:06 -0400
Received: from mga05.intel.com ([192.55.52.43]:40832 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2442787AbgJUNBD (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Oct 2020 09:01:03 -0400
IronPort-SDR: G0ITZuDh7/4qMUtPPxX1v6WnUA1FZoOKyQ63+iBOdJbNZRgJVJ9zw0FLfFHgE9iRcuhyyI0k49
 aoumwEy6z7Xg==
X-IronPort-AV: E=McAfee;i="6000,8403,9780"; a="252057577"
X-IronPort-AV: E=Sophos;i="5.77,401,1596524400"; 
   d="scan'208";a="252057577"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2020 06:00:58 -0700
IronPort-SDR: lM5wSd6+wT4tggVCLwdGbIPibdst4g5SbujPDO31XcaiYsSmH6OSi9IHSmujusMtC9jZyu4c8a
 HvaYv53wmvcQ==
X-IronPort-AV: E=Sophos;i="5.77,401,1596524400"; 
   d="scan'208";a="522735609"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2020 06:00:55 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 4CB9020815; Wed, 21 Oct 2020 16:00:33 +0300 (EEST)
Date:   Wed, 21 Oct 2020 16:00:33 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hugues Fruchet <hugues.fruchet@st.com>
Cc:     Alexandre Torgue <alexandre.torgue@st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Alain Volmat <alain.volmat@st.com>,
        Yannick Fertre <yannick.fertre@st.com>,
        Philippe CORNU <philippe.cornu@st.com>
Subject: Re: [PATCH v4 2/2] media: dt-bindings: media: st,stm32-dcmi: Add
 support of BT656
Message-ID: <20201021130033.GI2703@paasikivi.fi.intel.com>
References: <1603188889-23664-1-git-send-email-hugues.fruchet@st.com>
 <1603188889-23664-3-git-send-email-hugues.fruchet@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1603188889-23664-3-git-send-email-hugues.fruchet@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hugues,

On Tue, Oct 20, 2020 at 12:14:49PM +0200, Hugues Fruchet wrote:
> Add support of BT656 parallel bus mode in DCMI.
> This mode is enabled when hsync-active & vsync-active
> fields are not specified.
> 
> Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
> ---
>  .../devicetree/bindings/media/st,stm32-dcmi.yaml   | 30 ++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
> index 3fe778c..1ee521a 100644
> --- a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
> +++ b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
> @@ -44,6 +44,36 @@ properties:
>        bindings defined in
>        Documentation/devicetree/bindings/media/video-interfaces.txt.
>  
> +    properties:
> +      endpoint:
> +        type: object
> +
> +        properties:
> +          bus-width: true
> +
> +          hsync-active:
> +            description:
> +              If both HSYNC and VSYNC polarities are not specified, BT656
> +              embedded synchronization is selected.
> +            default: 0
> +
> +          vsync-active:
> +            description:
> +              If both HSYNC and VSYNC polarities are not specified, BT656
> +              embedded synchronization is selected.
> +            default: 0

Should I understand this as if the polarities were not specified, BT.656
will be used? The bindings previously documented BT.601 (parallel) only, so
it was somewhat ambigious to begin with. Is there a risk of interpreting
old BT.601 bindings as BT.656? With bus-type property, I believe you could
avoid at least that risk.

Also not specifying at least one of the default values leads to BT.656
without bus-type. That could be addressed by removing the defaults.

> +
> +          pclk-sample: true
> +
> +          remote-endpoint: true
> +
> +        required:
> +          - remote-endpoint
> +
> +        additionalProperties: false
> +
> +    additionalProperties: false
> +
>  required:
>    - compatible
>    - reg

-- 
Regards,

Sakari Ailus
