Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6FE88FD8C
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2019 10:17:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726801AbfHPIQr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Aug 2019 04:16:47 -0400
Received: from mga07.intel.com ([134.134.136.100]:43627 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726575AbfHPIQr (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Aug 2019 04:16:47 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 16 Aug 2019 01:16:22 -0700
X-IronPort-AV: E=Sophos;i="5.64,391,1559545200"; 
   d="scan'208";a="167990821"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 16 Aug 2019 01:16:19 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 7606820ABC; Fri, 16 Aug 2019 11:15:14 +0300 (EEST)
Date:   Fri, 16 Aug 2019 11:15:14 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hugues Fruchet <hugues.fruchet@st.com>
Cc:     Alexandre Torgue <alexandre.torgue@st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Yannick Fertre <yannick.fertre@st.com>,
        Philippe CORNU <philippe.cornu@st.com>,
        Mickael GUENE <mickael.guene@st.com>
Subject: Re: [PATCH v6 2/4] media: stm32-dcmi: trace the supported
 fourcc/mbus_code
Message-ID: <20190816081514.GU6133@paasikivi.fi.intel.com>
References: <1565790533-10043-1-git-send-email-hugues.fruchet@st.com>
 <1565790533-10043-3-git-send-email-hugues.fruchet@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1565790533-10043-3-git-send-email-hugues.fruchet@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hugues,

On Wed, Aug 14, 2019 at 03:48:51PM +0200, Hugues Fruchet wrote:
> Add a trace of the set of supported fourcc/mbus_code which
> intersect between DCMI and source sub-device.
> 
> Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
> ---
>  drivers/media/platform/stm32/stm32-dcmi.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/stm32/stm32-dcmi.c b/drivers/media/platform/stm32/stm32-dcmi.c
> index b462f71..18acecf 100644
> --- a/drivers/media/platform/stm32/stm32-dcmi.c
> +++ b/drivers/media/platform/stm32/stm32-dcmi.c
> @@ -1447,12 +1447,20 @@ static int dcmi_formats_init(struct stm32_dcmi *dcmi)
>  			/* Code supported, have we got this fourcc yet? */
>  			for (j = 0; j < num_fmts; j++)
>  				if (sd_fmts[j]->fourcc ==
> -						dcmi_formats[i].fourcc)
> +						dcmi_formats[i].fourcc) {
>  					/* Already available */
> +					dev_dbg(dcmi->dev, "Skipping fourcc/code: %4.4s/0x%x\n",
> +						(char *)&sd_fmts[j]->fourcc,
> +						mbus_code.code);
>  					break;
> -			if (j == num_fmts)
> +				}
> +			if (j == num_fmts) {
>  				/* New */
>  				sd_fmts[num_fmts++] = dcmi_formats + i;
> +				dev_dbg(dcmi->dev, "Supported fourcc/code: %4.4s/0x%x\n",

Over 80 characters per line.

> +					(char *)&sd_fmts[num_fmts - 1]->fourcc,
> +					sd_fmts[num_fmts - 1]->mbus_code);
> +			}
>  		}
>  		mbus_code.index++;
>  	}

-- 
Regards,

Sakari Ailus
sakari.ailus@linux.intel.com
