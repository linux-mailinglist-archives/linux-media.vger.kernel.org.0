Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C2E536FEA5
	for <lists+linux-media@lfdr.de>; Fri, 30 Apr 2021 18:35:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229877AbhD3QeU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Apr 2021 12:34:20 -0400
Received: from mga18.intel.com ([134.134.136.126]:5703 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229720AbhD3QeU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Apr 2021 12:34:20 -0400
IronPort-SDR: GNEVm4fFwP77uNLk7VjXnoLsKCyvO+DLH/QdAzi82vgez7r8+FTTOdfoYFCi0m5OvTAkBd42Hk
 ugi6U9IvPZgQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9970"; a="184784617"
X-IronPort-AV: E=Sophos;i="5.82,263,1613462400"; 
   d="scan'208";a="184784617"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2021 09:33:31 -0700
IronPort-SDR: DrMN0VMbu9QJUeQc7uh/nqHswfWHpQ7/3MlyZ5sxQyWJxqATsZW+AY1WCGPQNKsChOZda6oEQJ
 EygGS+W4EyTg==
X-IronPort-AV: E=Sophos;i="5.82,263,1613462400"; 
   d="scan'208";a="527699777"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2021 09:33:29 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 4AECC203F0;
        Fri, 30 Apr 2021 19:33:27 +0300 (EEST)
Date:   Fri, 30 Apr 2021 19:33:27 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Deepak R Varma <drv@mailo.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: atomisp: pci: reposition braces as per
 coding style
Message-ID: <20210430163327.GI3@paasikivi.fi.intel.com>
References: <YIwk3KbVGRPJwKa4@dU2104>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YIwk3KbVGRPJwKa4@dU2104>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Deepak,

If you're touching all these lines, I might do a little more. Please see
the comments below.

On Fri, Apr 30, 2021 at 09:10:12PM +0530, Deepak R Varma wrote:
> Misplaced braces makes it difficult to follow the code easily. This also
> goes against the code style guidelines. This resolved following checkpatch
> complaints:
> 
> ERROR: open brace '{' following function definitions go on the next line
> ERROR: that open brace { should be on the previous line
> 
> Signed-off-by: Deepak R Varma <drv@mailo.com>
> ---
> 
> Please Note: There are several other checkpatch triggered warnings and
> errors that should be addressed in separate patches.
> 
> 
>  .../staging/media/atomisp/pci/atomisp_csi2.c  |   3 +-
>  .../staging/media/atomisp/pci/sh_css_mipi.c   |  69 +++----
>  .../staging/media/atomisp/pci/sh_css_params.c | 171 ++++++++----------
>  drivers/staging/media/atomisp/pci/sh_css_sp.c | 108 +++++------
>  .../media/atomisp/pci/sh_css_version.c        |   3 +-
>  5 files changed, 157 insertions(+), 197 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2.c b/drivers/staging/media/atomisp/pci/atomisp_csi2.c
> index 060b8765ae96..200f16994f3a 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_csi2.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_csi2.c
> @@ -29,7 +29,8 @@ static struct v4l2_mbus_framefmt *__csi2_get_format(struct
>  	v4l2_subdev_pad_config *cfg,
>  	enum
>  	v4l2_subdev_format_whence

You could have more arguments on the same line up to 80 characters per
line.

> -	which, unsigned int pad) {
> +	which, unsigned int pad)
> +{
>  	if (which == V4L2_SUBDEV_FORMAT_TRY)
>  		return v4l2_subdev_get_try_format(&csi2->subdev, cfg, pad);
>  	else
> diff --git a/drivers/staging/media/atomisp/pci/sh_css_mipi.c b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
> index 3f34cc81be87..75489f7d75ee 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css_mipi.c
> +++ b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
> @@ -91,7 +91,8 @@ ia_css_mipi_frame_calculate_size(const unsigned int width,
>  				 const enum atomisp_input_format format,
>  				 const bool hasSOLandEOL,
>  				 const unsigned int embedded_data_size_words,
> -				 unsigned int *size_mem_words) {
> +				 unsigned int *size_mem_words)
> +{
>  	int err = 0;
>  
>  	unsigned int bits_per_pixel = 0;
> @@ -118,8 +119,7 @@ ia_css_mipi_frame_calculate_size(const unsigned int width,
>  	IA_CSS_ENTER("padded_width=%d, height=%d, format=%d, hasSOLandEOL=%d, embedded_data_size_words=%d\n",
>  		     width_padded, height, format, hasSOLandEOL, embedded_data_size_words);
>  
> -	switch (format)
> -	{
> +	switch (format) {
>  	case ATOMISP_INPUT_FORMAT_RAW_6:		/* 4p, 3B, 24bits */
>  		bits_per_pixel = 6;
>  		break;
> @@ -178,12 +178,10 @@ ia_css_mipi_frame_calculate_size(const unsigned int width,
>  	/* Even lines for YUV420 formats are double in bits_per_pixel. */
>  	if (format == ATOMISP_INPUT_FORMAT_YUV420_8
>  	    || format == ATOMISP_INPUT_FORMAT_YUV420_10
> -	    || format == ATOMISP_INPUT_FORMAT_YUV420_16)
> -	{
> +	    || format == ATOMISP_INPUT_FORMAT_YUV420_16) {
>  		even_line_bytes = (width_padded * 2 * bits_per_pixel + 7) >>
>  			3; /* ceil ( bits per line / 8) */
> -	} else
> -	{
> +	} else {
>  		even_line_bytes = odd_line_bytes;
>  	}
>  
> @@ -236,7 +234,8 @@ ia_css_mipi_frame_calculate_size(const unsigned int width,
>  #if !defined(ISP2401)
>  int
>  ia_css_mipi_frame_enable_check_on_size(const enum mipi_port_id port,
> -				       const unsigned int	size_mem_words) {
> +				       const unsigned int	size_mem_words)

Tab after int, should be a space.

> +{
>  	u32 idx;
>  
>  	int err = -EBUSY;
> @@ -246,11 +245,9 @@ ia_css_mipi_frame_enable_check_on_size(const enum mipi_port_id port,
>  
>  	for (idx = 0; idx < IA_CSS_MIPI_SIZE_CHECK_MAX_NOF_ENTRIES_PER_PORT &&
>  	     my_css.mipi_sizes_for_check[port][idx] != 0;
> -	     idx++)   /* do nothing */
> -	{
> +	     idx++) { /* do nothing */
>  	}

A semicolon suffices here. I guess this could be also written as:

	for (idx = 0; idx < ... & ... != 0; )
		idx++;

As it's easy to just miss the semicolon at the end of the for loop.

> -	if (idx < IA_CSS_MIPI_SIZE_CHECK_MAX_NOF_ENTRIES_PER_PORT)
> -	{
> +	if (idx < IA_CSS_MIPI_SIZE_CHECK_MAX_NOF_ENTRIES_PER_PORT) {
>  		my_css.mipi_sizes_for_check[port][idx] = size_mem_words;
>  		err = 0;
>  	}
> @@ -271,7 +268,8 @@ mipi_init(void)
>  int
>  calculate_mipi_buff_size(
>      struct ia_css_stream_config *stream_cfg,
> -    unsigned int *size_mem_words) {
> +    unsigned int *size_mem_words)

I think both arguments might fit on the same line. If not, then the return
type (int) does. I think there are other similar cases.

> +{
>  #if !defined(ISP2401)
>  	int err = -EINVAL;
>  	(void)stream_cfg;
> @@ -346,12 +344,10 @@ calculate_mipi_buff_size(
>  
>  	/* Even lines for YUV420 formats are double in bits_per_pixel. */
>  	if (format == ATOMISP_INPUT_FORMAT_YUV420_8
> -	    || format == ATOMISP_INPUT_FORMAT_YUV420_10)
> -	{
> +	    || format == ATOMISP_INPUT_FORMAT_YUV420_10) {
>  		even_line_bytes = (width_padded * 2 * bits_per_pixel + 7) >>
>  			3; /* ceil ( bits per line / 8) */

You don't need braces here.

> -	} else
> -	{
> +	} else {
>  		even_line_bytes = odd_line_bytes;
>  	}
>  
> @@ -393,7 +389,8 @@ static bool buffers_needed(struct ia_css_pipe *pipe)
>  
>  int
>  allocate_mipi_frames(struct ia_css_pipe *pipe,
> -		     struct ia_css_stream_info *info) {
> +		     struct ia_css_stream_info *info)
> +{
>  	int err = -EINVAL;
>  	unsigned int port;
>  
> @@ -402,8 +399,7 @@ allocate_mipi_frames(struct ia_css_pipe *pipe,
>  
>  	assert(pipe);
>  	assert(pipe->stream);
> -	if ((!pipe) || (!pipe->stream))
> -	{
> +	if ((!pipe) || (!pipe->stream)) {

Extra parentheses.

-- 
Kind regards,

Sakari Ailus
