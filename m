Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49459368F71
	for <lists+linux-media@lfdr.de>; Fri, 23 Apr 2021 11:33:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241759AbhDWJec (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Apr 2021 05:34:32 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:37545 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241737AbhDWJeb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Apr 2021 05:34:31 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id ZsC7l07MbvTEDZsCAlcpe4; Fri, 23 Apr 2021 11:33:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1619170434; bh=iG/2P9hX5ncerO20cWJRBBRvJoUewMfLX8llGChbWGs=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=tr6FMoNMQ+tBbjnlet62+SPjQpvBMxWqUbBtgLLeRao1rdpf2bMOH1v05rv5DDkRP
         lpzGv7v1vI8NbqCJqnRxNVGLrAF1mzk/GKPlAuIlo5RY3ln7tdJW+uLRIrYVQiYcQ2
         2c1k6oN1uPPj1v0ZzNxHf03LbVRfTBlQ/0Y24xz62/4HSBHpTrcJTPXYfP35MOAyXE
         +HYhTzFqhxac9cls8EJv9UWhZ3rssOw4Ir9A/eeeDi4jisbjiPJU1W9VAWiBt4zO2d
         A8bdsvjhOrPRC0uZarRqbw6HDMeHrcUsdh+MMpi9j3LtngEPdQRdZD7bn39xziG48m
         RkJfVaRcJDt4w==
Subject: Re: [PATCHv2 7/8] staging: media: atomisp: Fix line split style
 issues
To:     Martiros Shakhzadyan <vrzh@vrzh.net>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
References: <20210420153201.583342-1-vrzh@vrzh.net>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <fe513e9f-bd8d-2c4d-091a-205723e70738@xs4all.nl>
Date:   Fri, 23 Apr 2021 11:33:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210420153201.583342-1-vrzh@vrzh.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfMwUA3sPUYzz+iY+Ipf61K13VxJYXfyC+16u/PWMubE/+cy/3JDzL8kgPBu4Ecxe8NCRkFYTbOZMU1WGufsDP5PUxzIlzW0zHMpzX0ePVBApR1z2U2h3
 yWcbaa435jQBYqa9XNDqM/Kj1530Y+lhsUWNwzAddNwoLaw9VJCngf1Zj0K6oD8qEPGrCBeW2kiSXOULtM3XYZHKmmyoIe5V5sZXXdpJ63YIGV8y7bYkPuBy
 1C+3IVXDtGNTlwa1OynYNz/ZRnwCO6Y/BFjylPirCrTPinGlG69nprXAn3oECMwr
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 20/04/2021 17:32, Martiros Shakhzadyan wrote:
> Fix coding style issues

While you are at it, can you also remove the redundant parenthesis?

$ scripts/checkpatch.pl --strict ~/PATCHv2-7-8-staging-media-atomisp-Fix-line-split-style-issues.patch
CHECK: Unnecessary parentheses around 'buf_type == IA_CSS_BUFFER_TYPE_3A_STATISTICS'
#100: FILE: drivers/staging/media/atomisp/pci/sh_css.c:4125:
+       if ((buf_type == IA_CSS_BUFFER_TYPE_3A_STATISTICS) ||
+           (buf_type == IA_CSS_BUFFER_TYPE_DIS_STATISTICS) ||
+           (buf_type == IA_CSS_BUFFER_TYPE_LACE_STATISTICS)) {

CHECK: Unnecessary parentheses around 'buf_type == IA_CSS_BUFFER_TYPE_DIS_STATISTICS'
#100: FILE: drivers/staging/media/atomisp/pci/sh_css.c:4125:
+       if ((buf_type == IA_CSS_BUFFER_TYPE_3A_STATISTICS) ||
+           (buf_type == IA_CSS_BUFFER_TYPE_DIS_STATISTICS) ||
+           (buf_type == IA_CSS_BUFFER_TYPE_LACE_STATISTICS)) {

CHECK: Unnecessary parentheses around 'buf_type == IA_CSS_BUFFER_TYPE_LACE_STATISTICS'
#100: FILE: drivers/staging/media/atomisp/pci/sh_css.c:4125:
+       if ((buf_type == IA_CSS_BUFFER_TYPE_3A_STATISTICS) ||
+           (buf_type == IA_CSS_BUFFER_TYPE_DIS_STATISTICS) ||
+           (buf_type == IA_CSS_BUFFER_TYPE_LACE_STATISTICS)) {

CHECK: Unnecessary parentheses around '!pipe'
#170: FILE: drivers/staging/media/atomisp/pci/sh_css.c:6556:
+       if ((!pipe) || ((pipe->mode != IA_CSS_PIPE_ID_CAPTURE) &&
+                       (pipe->mode != IA_CSS_PIPE_ID_COPY))) {

CHECK: Unnecessary parentheses around 'pipe->mode != IA_CSS_PIPE_ID_CAPTURE'
#170: FILE: drivers/staging/media/atomisp/pci/sh_css.c:6556:
+       if ((!pipe) || ((pipe->mode != IA_CSS_PIPE_ID_CAPTURE) &&
+                       (pipe->mode != IA_CSS_PIPE_ID_COPY))) {

CHECK: Unnecessary parentheses around 'pipe->mode != IA_CSS_PIPE_ID_COPY'
#170: FILE: drivers/staging/media/atomisp/pci/sh_css.c:6556:
+       if ((!pipe) || ((pipe->mode != IA_CSS_PIPE_ID_CAPTURE) &&
+                       (pipe->mode != IA_CSS_PIPE_ID_COPY))) {

total: 0 errors, 0 warnings, 6 checks, 167 lines checked

That would make it look a bit less like lisp :-)

Regards,

	Hans

> 
> Signed-off-by: Martiros Shakhzadyan <vrzh@vrzh.net>
> ---
>  drivers/staging/media/atomisp/pci/sh_css.c | 77 ++++++++++------------
>  1 file changed, 35 insertions(+), 42 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
> index e9d96f36b12f..f0a54f1fea6f 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css.c
> +++ b/drivers/staging/media/atomisp/pci/sh_css.c
> @@ -308,8 +308,7 @@ sh_css_pipeline_add_acc_stage(struct ia_css_pipeline *pipeline,
>  			      const void *acc_fw);
>  
>  static int
> -alloc_continuous_frames(
> -    struct ia_css_pipe *pipe, bool init_time);
> +alloc_continuous_frames(struct ia_css_pipe *pipe, bool init_time);
>  
>  static void
>  pipe_global_init(void);
> @@ -2622,8 +2621,7 @@ static int load_copy_binary(
>  }
>  
>  static int
> -alloc_continuous_frames(
> -    struct ia_css_pipe *pipe, bool init_time)
> +alloc_continuous_frames(struct ia_css_pipe *pipe, bool init_time)
>  {
>  	int err = 0;
>  	struct ia_css_frame_info ref_info;
> @@ -4080,11 +4078,11 @@ ia_css_pipe_enqueue_buffer(struct ia_css_pipe *pipe,
>  		}
>  		ddr_buffer.kernel_ptr = HOST_ADDRESS(buffer->data.metadata);
>  		ddr_buffer.payload.metadata = *buffer->data.metadata;
> -	} else if ((buf_type == IA_CSS_BUFFER_TYPE_INPUT_FRAME)
> -		   || (buf_type == IA_CSS_BUFFER_TYPE_OUTPUT_FRAME)
> -		   || (buf_type == IA_CSS_BUFFER_TYPE_VF_OUTPUT_FRAME)
> -		   || (buf_type == IA_CSS_BUFFER_TYPE_SEC_OUTPUT_FRAME)
> -		   || (buf_type == IA_CSS_BUFFER_TYPE_SEC_VF_OUTPUT_FRAME)) {
> +	} else if ((buf_type == IA_CSS_BUFFER_TYPE_INPUT_FRAME) ||
> +		   (buf_type == IA_CSS_BUFFER_TYPE_OUTPUT_FRAME) ||
> +		   (buf_type == IA_CSS_BUFFER_TYPE_VF_OUTPUT_FRAME) ||
> +		   (buf_type == IA_CSS_BUFFER_TYPE_SEC_OUTPUT_FRAME) ||
> +		   (buf_type == IA_CSS_BUFFER_TYPE_SEC_VF_OUTPUT_FRAME)) {
>  		if (!buffer->data.frame) {
>  			IA_CSS_LEAVE_ERR(-EINVAL);
>  			return -EINVAL;
> @@ -4124,9 +4122,9 @@ ia_css_pipe_enqueue_buffer(struct ia_css_pipe *pipe,
>  	hmm_store(h_vbuf->vptr,
>  		   (void *)(&ddr_buffer),
>  		   sizeof(struct sh_css_hmm_buffer));
> -	if ((buf_type == IA_CSS_BUFFER_TYPE_3A_STATISTICS)
> -	    || (buf_type == IA_CSS_BUFFER_TYPE_DIS_STATISTICS)
> -	    || (buf_type == IA_CSS_BUFFER_TYPE_LACE_STATISTICS)) {
> +	if ((buf_type == IA_CSS_BUFFER_TYPE_3A_STATISTICS) ||
> +	    (buf_type == IA_CSS_BUFFER_TYPE_DIS_STATISTICS) ||
> +	    (buf_type == IA_CSS_BUFFER_TYPE_LACE_STATISTICS)) {
>  		if (!pipeline) {
>  			ia_css_rmgr_rel_vbuf(hmm_buffer_pool, &h_vbuf);
>  			IA_CSS_LOG("pipeline is empty!");
> @@ -4144,12 +4142,12 @@ ia_css_pipe_enqueue_buffer(struct ia_css_pipe *pipe,
>  									(uint32_t)h_vbuf->vptr);
>  			}
>  		}
> -	} else if ((buf_type == IA_CSS_BUFFER_TYPE_INPUT_FRAME)
> -		   || (buf_type == IA_CSS_BUFFER_TYPE_OUTPUT_FRAME)
> -		   || (buf_type == IA_CSS_BUFFER_TYPE_VF_OUTPUT_FRAME)
> -		   || (buf_type == IA_CSS_BUFFER_TYPE_SEC_OUTPUT_FRAME)
> -		   || (buf_type == IA_CSS_BUFFER_TYPE_SEC_VF_OUTPUT_FRAME)
> -		   || (buf_type == IA_CSS_BUFFER_TYPE_METADATA)) {
> +	} else if ((buf_type == IA_CSS_BUFFER_TYPE_INPUT_FRAME) ||
> +		   (buf_type == IA_CSS_BUFFER_TYPE_OUTPUT_FRAME) ||
> +		   (buf_type == IA_CSS_BUFFER_TYPE_VF_OUTPUT_FRAME) ||
> +		   (buf_type == IA_CSS_BUFFER_TYPE_SEC_OUTPUT_FRAME) ||
> +		   (buf_type == IA_CSS_BUFFER_TYPE_SEC_VF_OUTPUT_FRAME) ||
> +		   (buf_type == IA_CSS_BUFFER_TYPE_METADATA)) {
>  		return_err = ia_css_bufq_enqueue_buffer(thread_id,
>  							queue_id,
>  							(uint32_t)h_vbuf->vptr);
> @@ -6196,8 +6194,7 @@ allocate_delay_frames(struct ia_css_pipe *pipe)
>  	return 0;
>  }
>  
> -static int load_advanced_binaries(
> -    struct ia_css_pipe *pipe)
> +static int load_advanced_binaries(struct ia_css_pipe *pipe)
>  {
>  	struct ia_css_frame_info pre_in_info, gdc_in_info,
>  			post_in_info, post_out_info,
> @@ -6314,8 +6311,7 @@ static int load_advanced_binaries(
>  	return err;
>  }
>  
> -static int load_bayer_isp_binaries(
> -    struct ia_css_pipe *pipe)
> +static int load_bayer_isp_binaries(struct ia_css_pipe *pipe)
>  {
>  	struct ia_css_frame_info pre_isp_in_info, *pipe_out_info;
>  	int err = 0;
> @@ -6344,8 +6340,7 @@ static int load_bayer_isp_binaries(
>  	return err;
>  }
>  
> -static int load_low_light_binaries(
> -    struct ia_css_pipe *pipe)
> +static int load_low_light_binaries(struct ia_css_pipe *pipe)
>  {
>  	struct ia_css_frame_info pre_in_info, anr_in_info,
>  			post_in_info, post_out_info,
> @@ -6483,8 +6478,7 @@ static bool copy_on_sp(struct ia_css_pipe *pipe)
>  	return rval;
>  }
>  
> -static int load_capture_binaries(
> -    struct ia_css_pipe *pipe)
> +static int load_capture_binaries(struct ia_css_pipe *pipe)
>  {
>  	int err = 0;
>  	bool must_be_raw;
> @@ -6559,7 +6553,8 @@ unload_capture_binaries(struct ia_css_pipe *pipe)
>  
>  	IA_CSS_ENTER_PRIVATE("pipe = %p", pipe);
>  
> -	if ((!pipe) || ((pipe->mode != IA_CSS_PIPE_ID_CAPTURE) && (pipe->mode != IA_CSS_PIPE_ID_COPY))) {
> +	if ((!pipe) || ((pipe->mode != IA_CSS_PIPE_ID_CAPTURE) &&
> +			(pipe->mode != IA_CSS_PIPE_ID_COPY))) {
>  		IA_CSS_LEAVE_ERR_PRIVATE(-EINVAL);
>  		return -EINVAL;
>  	}
> @@ -6636,10 +6631,10 @@ need_yuv_scaler_stage(const struct ia_css_pipe *pipe)
>  /* which has some hard-coded knowledge which prevents reuse of the function. */
>  /* Later, merge this with ia_css_pipe_create_cas_scaler_desc */
>  static int ia_css_pipe_create_cas_scaler_desc_single_output(
> -    struct ia_css_frame_info *cas_scaler_in_info,
> -    struct ia_css_frame_info *cas_scaler_out_info,
> -    struct ia_css_frame_info *cas_scaler_vf_info,
> -    struct ia_css_cas_binary_descr *descr)
> +	    struct ia_css_frame_info *cas_scaler_in_info,
> +	    struct ia_css_frame_info *cas_scaler_out_info,
> +	    struct ia_css_frame_info *cas_scaler_vf_info,
> +	    struct ia_css_cas_binary_descr *descr)
>  {
>  	unsigned int i;
>  	unsigned int hor_ds_factor = 0, ver_ds_factor = 0;
> @@ -6756,9 +6751,9 @@ static int ia_css_pipe_create_cas_scaler_desc_single_output(
>  }
>  
>  /* FIXME: merge most of this and single output version */
> -static int ia_css_pipe_create_cas_scaler_desc(
> -    struct ia_css_pipe *pipe,
> -    struct ia_css_cas_binary_descr *descr)
> +static int
> +ia_css_pipe_create_cas_scaler_desc(struct ia_css_pipe *pipe,
> +				   struct ia_css_cas_binary_descr *descr)
>  {
>  	struct ia_css_frame_info in_info = IA_CSS_BINARY_DEFAULT_FRAME_INFO;
>  	struct ia_css_frame_info *out_info[IA_CSS_PIPE_MAX_OUTPUT_STAGE];
> @@ -7925,7 +7920,9 @@ create_host_regular_capture_pipeline(struct ia_css_pipe *pipe)
>  	    * should not be considered as a clean solution. Proper
>  	    * investigation should be done to come up with the clean solution.
>  	    * */
> -	if (mode != IA_CSS_CAPTURE_MODE_RAW && mode != IA_CSS_CAPTURE_MODE_BAYER && current_stage && vf_frame) {
> +	if (mode != IA_CSS_CAPTURE_MODE_RAW &&
> +	    mode != IA_CSS_CAPTURE_MODE_BAYER &&
> +	    current_stage && vf_frame) {
>  		in_frame = current_stage->args.out_vf_frame;
>  		err = add_vf_pp_stage(pipe, in_frame, vf_frame, vf_pp_binary,
>  					&current_stage);
> @@ -7963,8 +7960,7 @@ create_host_capture_pipeline(struct ia_css_pipe *pipe)
>  	return err;
>  }
>  
> -static int capture_start(
> -    struct ia_css_pipe *pipe)
> +static int capture_start(struct ia_css_pipe *pipe)
>  {
>  	struct ia_css_pipeline *me;
>  
> @@ -8365,11 +8361,8 @@ int ia_css_stream_capture_frame(struct ia_css_stream *stream,
>      * @brief Configure the continuous capture.
>      * Refer to "sh_css_internal.h" for details.
>      */
> -int ia_css_stream_capture(
> -    struct ia_css_stream *stream,
> -    int num_captures,
> -    unsigned int skip,
> -    int offset)
> +int ia_css_stream_capture(struct ia_css_stream *stream, int num_captures,
> +			  unsigned int skip, int offset)
>  {
>  	struct sh_css_tag_descr tag_descr;
>  	unsigned int encoded_tag_descr;
> 

