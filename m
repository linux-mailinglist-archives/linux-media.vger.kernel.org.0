Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53AF41D749B
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2020 12:01:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726339AbgERKA7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 May 2020 06:00:59 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:55344 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726040AbgERKA6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 May 2020 06:00:58 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0A729258;
        Mon, 18 May 2020 12:00:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1589796054;
        bh=GF+gQWiyYm4bxcGhwywp1QWlRV1Rd9vY+4J+r9+Pr2c=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=kh2TB2A4M3NVeBuwYsgQutbRvfOBrGgg+4MWJJnoaTxJrW8Uqg/1hEnXJyO/oMOw0
         XA4H4wjMRUicvisPjn+lOM9h3E99Mw/CQ8IWzppIa+TqjJ9XTZ8beSah3dFUyehK6X
         XBq83TfVGEg0ZjfQqTJB0mnzaEX/0hp4S117Nqbs=
Reply-To: kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v3 3/8] media: i2c: ov6650: Use new [g|s]_mbus_config op
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com
Cc:     niklas.soderlund+renesas@ragnatech.se,
        dave.stevenson@raspberrypi.com, hyun.kwon@xilinx.com,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20200514164540.507233-1-jacopo+renesas@jmondi.org>
 <20200514164540.507233-5-jacopo+renesas@jmondi.org>
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Autocrypt: addr=kieran.bingham@ideasonboard.com; keydata=
 mQINBFYE/WYBEACs1PwjMD9rgCu1hlIiUA1AXR4rv2v+BCLUq//vrX5S5bjzxKAryRf0uHat
 V/zwz6hiDrZuHUACDB7X8OaQcwhLaVlq6byfoBr25+hbZG7G3+5EUl9cQ7dQEdvNj6V6y/SC
 rRanWfelwQThCHckbobWiQJfK9n7rYNcPMq9B8e9F020LFH7Kj6YmO95ewJGgLm+idg1Kb3C
 potzWkXc1xmPzcQ1fvQMOfMwdS+4SNw4rY9f07Xb2K99rjMwZVDgESKIzhsDB5GY465sCsiQ
 cSAZRxqE49RTBq2+EQsbrQpIc8XiffAB8qexh5/QPzCmR4kJgCGeHIXBtgRj+nIkCJPZvZtf
 Kr2EAbc6tgg6DkAEHJb+1okosV09+0+TXywYvtEop/WUOWQ+zo+Y/OBd+8Ptgt1pDRyOBzL8
 RXa8ZqRf0Mwg75D+dKntZeJHzPRJyrlfQokngAAs4PaFt6UfS+ypMAF37T6CeDArQC41V3ko
 lPn1yMsVD0p+6i3DPvA/GPIksDC4owjnzVX9kM8Zc5Cx+XoAN0w5Eqo4t6qEVbuettxx55gq
 8K8FieAjgjMSxngo/HST8TpFeqI5nVeq0/lqtBRQKumuIqDg+Bkr4L1V/PSB6XgQcOdhtd36
 Oe9X9dXB8YSNt7VjOcO7BTmFn/Z8r92mSAfHXpb07YJWJosQOQARAQABtDBLaWVyYW4gQmlu
 Z2hhbSA8a2llcmFuLmJpbmdoYW1AaWRlYXNvbmJvYXJkLmNvbT6JAlcEEwEKAEECGwMFCwkI
 BwIGFQgJCgsCBBYCAwECHgECF4ACGQEWIQSQLdeYP70o/eNy1HqhHkZyEKRh/QUCXWTtygUJ
 CyJXZAAKCRChHkZyEKRh/f8dEACTDsbLN2nioNZMwyLuQRUAFcXNolDX48xcUXsWS2QjxaPm
 VsJx8Uy8aYkS85mdPBh0C83OovQR/OVbr8AxhGvYqBs3nQvbWuTl/+4od7DfK2VZOoKBAu5S
 QK2FYuUcikDqYcFWJ8DQnubxfE8dvzojHEkXw0sA4igINHDDFX3HJGZtLio+WpEFQtCbfTAG
 YZslasz1YZRbwEdSsmO3/kqy5eMnczlm8a21A3fKUo3g8oAZEFM+f4DUNzqIltg31OAB/kZS
 enKZQ/SWC8PmLg/ZXBrReYakxXtkP6w3FwMlzOlhGxqhIRNiAJfXJBaRhuUWzPOpEDE9q5YJ
 BmqQL2WJm1VSNNVxbXJHpaWMH1sA2R00vmvRrPXGwyIO0IPYeUYQa3gsy6k+En/aMQJd27dp
 aScf9am9PFICPY5T4ppneeJLif2lyLojo0mcHOV+uyrds9XkLpp14GfTkeKPdPMrLLTsHRfH
 fA4I4OBpRrEPiGIZB/0im98MkGY/Mu6qxeZmYLCcgD6qz4idOvfgVOrNh+aA8HzIVR+RMW8H
 QGBN9f0E3kfwxuhl3omo6V7lDw8XOdmuWZNC9zPq1UfryVHANYbLGz9KJ4Aw6M+OgBC2JpkD
 hXMdHUkC+d20dwXrwHTlrJi1YNp6rBc+xald3wsUPOZ5z8moTHUX/uPA/qhGsbkCDQRWBP1m
 ARAAzijkb+Sau4hAncr1JjOY+KyFEdUNxRy+hqTJdJfaYihxyaj0Ee0P0zEi35CbE6lgU0Uz
 tih9fiUbSV3wfsWqg1Ut3/5rTKu7kLFp15kF7eqvV4uezXRD3Qu4yjv/rMmEJbbD4cTvGCYI
 d6MDC417f7vK3hCbCVIZSp3GXxyC1LU+UQr3fFcOyCwmP9vDUR9JV0BSqHHxRDdpUXE26Dk6
 mhf0V1YkspE5St814ETXpEus2urZE5yJIUROlWPIL+hm3NEWfAP06vsQUyLvr/GtbOT79vXl
 En1aulcYyu20dRRxhkQ6iILaURcxIAVJJKPi8dsoMnS8pB0QW12AHWuirPF0g6DiuUfPmrA5
 PKe56IGlpkjc8cO51lIxHkWTpCMWigRdPDexKX+Sb+W9QWK/0JjIc4t3KBaiG8O4yRX8ml2R
 +rxfAVKM6V769P/hWoRGdgUMgYHFpHGSgEt80OKK5HeUPy2cngDUXzwrqiM5Sz6Od0qw5pCk
 NlXqI0W/who0iSVM+8+RmyY0OEkxEcci7rRLsGnM15B5PjLJjh1f2ULYkv8s4SnDwMZ/kE04
 /UqCMK/KnX8pwXEMCjz0h6qWNpGwJ0/tYIgQJZh6bqkvBrDogAvuhf60Sogw+mH8b+PBlx1L
 oeTK396wc+4c3BfiC6pNtUS5GpsPMMjYMk7kVvEAEQEAAYkCPAQYAQoAJgIbDBYhBJAt15g/
 vSj943LUeqEeRnIQpGH9BQJdizzIBQkLSKZiAAoJEKEeRnIQpGH9eYgQAJpjaWNgqNOnMTmD
 MJggbwjIotypzIXfhHNCeTkG7+qCDlSaBPclcPGYrTwCt0YWPU2TgGgJrVhYT20ierN8LUvj
 6qOPTd+Uk7NFzL65qkh80ZKNBFddx1AabQpSVQKbdcLb8OFs85kuSvFdgqZwgxA1vl4TFhNz
 PZ79NAmXLackAx3sOVFhk4WQaKRshCB7cSl+RIng5S/ThOBlwNlcKG7j7W2MC06BlTbdEkUp
 ECzuuRBv8wX4OQl+hbWbB/VKIx5HKlLu1eypen/5lNVzSqMMIYkkZcjV2SWQyUGxSwq0O/sx
 S0A8/atCHUXOboUsn54qdxrVDaK+6jIAuo8JiRWctP16KjzUM7MO0/+4zllM8EY57rXrj48j
 sbEYX0YQnzaj+jO6kJtoZsIaYR7rMMq9aUAjyiaEZpmP1qF/2sYenDx0Fg2BSlLvLvXM0vU8
 pQk3kgDu7kb/7PRYrZvBsr21EIQoIjXbZxDz/o7z95frkP71EaICttZ6k9q5oxxA5WC6sTXc
 MW8zs8avFNuA9VpXt0YupJd2ijtZy2mpZNG02fFVXhIn4G807G7+9mhuC4XG5rKlBBUXTvPU
 AfYnB4JBDLmLzBFavQfvonSfbitgXwCG3vS+9HEwAjU30Bar1PEOmIbiAoMzuKeRm2LVpmq4
 WZw01QYHU/GUV/zHJSFk
Organization: Ideas on Board
Message-ID: <dcd5aa4b-bbee-87c9-97ae-0c42fe01e627@ideasonboard.com>
Date:   Mon, 18 May 2020 11:00:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200514164540.507233-5-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

The $SUBJECT here references {g,s}_mbus instead of {get,set}_mbus... and
might also need updating.
--
Kieran

On 14/05/2020 17:45, Jacopo Mondi wrote:
> Use the new get_mbus_config and set_mbus_config pad operation in place
> of the video operations currently in use.
> 
> Compared to other drivers where the same conversion has been performed,
> ov6650 proves to be a bit more tricky, as the existing g_mbus_config
> implementation did not report the currently applied configuration but
> the set of all possible configuration options.
> 
> Adapt the driver to support the semantic of the two newly introduced
> operations:
> - get_mbus_config reports the current media bus configuration
> - set_mbus_config applies only changes explicitly requested and updates
>   the provided cfg parameter to report what has actually been applied to
>   the hardware.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/media/i2c/ov6650.c | 56 ++++++++++++++++++++++++++------------
>  1 file changed, 39 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov6650.c b/drivers/media/i2c/ov6650.c
> index 91906b94f978..efc798bac3a4 100644
> --- a/drivers/media/i2c/ov6650.c
> +++ b/drivers/media/i2c/ov6650.c
> @@ -921,46 +921,68 @@ static const struct v4l2_subdev_core_ops ov6650_core_ops = {
>  };
>  
>  /* Request bus settings on camera side */
> -static int ov6650_g_mbus_config(struct v4l2_subdev *sd,
> -				struct v4l2_mbus_config *cfg)
> +static int ov6650_get_mbus_config(struct v4l2_subdev *sd,
> +				  unsigned int pad,
> +				  struct v4l2_mbus_config *cfg)
>  {
> +	struct i2c_client *client = v4l2_get_subdevdata(sd);
> +	u8 comj, comf;
> +	int ret;
> +
> +	ret = ov6650_reg_read(client, REG_COMJ, &comj);
> +	if (ret)
> +		return ret;
>  
> -	cfg->flags = V4L2_MBUS_MASTER |
> -		V4L2_MBUS_PCLK_SAMPLE_RISING | V4L2_MBUS_PCLK_SAMPLE_FALLING |
> -		V4L2_MBUS_HSYNC_ACTIVE_HIGH | V4L2_MBUS_HSYNC_ACTIVE_LOW |
> -		V4L2_MBUS_VSYNC_ACTIVE_HIGH | V4L2_MBUS_VSYNC_ACTIVE_LOW |
> -		V4L2_MBUS_DATA_ACTIVE_HIGH;
> +	ret = ov6650_reg_read(client, REG_COMF, &comf);
> +	if (ret)
> +		return ret;
> +
> +	cfg->flags = V4L2_MBUS_MASTER
> +		   |  (comj & COMJ_VSYNC_HIGH  ? V4L2_MBUS_VSYNC_ACTIVE_HIGH
> +					       : V4L2_MBUS_VSYNC_ACTIVE_LOW)
> +		   |  (comf & COMF_HREF_LOW    ? V4L2_MBUS_HSYNC_ACTIVE_LOW
> +					       : V4L2_MBUS_HSYNC_ACTIVE_HIGH)
> +		   |  (comj & COMJ_PCLK_RISING ? V4L2_MBUS_PCLK_SAMPLE_RISING
> +					       : V4L2_MBUS_PCLK_SAMPLE_FALLING);
>  	cfg->type = V4L2_MBUS_PARALLEL;
>  
>  	return 0;
>  }
>  
>  /* Alter bus settings on camera side */
> -static int ov6650_s_mbus_config(struct v4l2_subdev *sd,
> -				const struct v4l2_mbus_config *cfg)
> +static int ov6650_set_mbus_config(struct v4l2_subdev *sd,
> +				  unsigned int pad,
> +				  struct v4l2_mbus_config *cfg)
>  {
>  	struct i2c_client *client = v4l2_get_subdevdata(sd);
> -	int ret;
> +	int ret = 0;
>  
>  	if (cfg->flags & V4L2_MBUS_PCLK_SAMPLE_RISING)
>  		ret = ov6650_reg_rmw(client, REG_COMJ, COMJ_PCLK_RISING, 0);
> -	else
> +	else if (cfg->flags & V4L2_MBUS_PCLK_SAMPLE_FALLING)
>  		ret = ov6650_reg_rmw(client, REG_COMJ, 0, COMJ_PCLK_RISING);
>  	if (ret)
> -		return ret;
> +		goto error;
>  
>  	if (cfg->flags & V4L2_MBUS_HSYNC_ACTIVE_LOW)
>  		ret = ov6650_reg_rmw(client, REG_COMF, COMF_HREF_LOW, 0);
> -	else
> +	else if (cfg->flags & V4L2_MBUS_HSYNC_ACTIVE_HIGH)
>  		ret = ov6650_reg_rmw(client, REG_COMF, 0, COMF_HREF_LOW);
>  	if (ret)
> -		return ret;
> +		goto error;
>  
>  	if (cfg->flags & V4L2_MBUS_VSYNC_ACTIVE_HIGH)
>  		ret = ov6650_reg_rmw(client, REG_COMJ, COMJ_VSYNC_HIGH, 0);
> -	else
> +	else if (cfg->flags & V4L2_MBUS_VSYNC_ACTIVE_LOW)
>  		ret = ov6650_reg_rmw(client, REG_COMJ, 0, COMJ_VSYNC_HIGH);
>  
> +error:
> +	/*
> +	 * Update the configuration to report what is actually applied to
> +	 * the hardware.
> +	 */
> +	ov6650_get_mbus_config(sd, pad, cfg);
> +
>  	return ret;
>  }
>  
> @@ -968,8 +990,6 @@ static const struct v4l2_subdev_video_ops ov6650_video_ops = {
>  	.s_stream	= ov6650_s_stream,
>  	.g_frame_interval = ov6650_g_frame_interval,
>  	.s_frame_interval = ov6650_s_frame_interval,
> -	.g_mbus_config	= ov6650_g_mbus_config,
> -	.s_mbus_config	= ov6650_s_mbus_config,
>  };
>  
>  static const struct v4l2_subdev_pad_ops ov6650_pad_ops = {
> @@ -978,6 +998,8 @@ static const struct v4l2_subdev_pad_ops ov6650_pad_ops = {
>  	.set_selection	= ov6650_set_selection,
>  	.get_fmt	= ov6650_get_fmt,
>  	.set_fmt	= ov6650_set_fmt,
> +	.get_mbus_config = ov6650_get_mbus_config,
> +	.set_mbus_config = ov6650_set_mbus_config,
>  };
>  
>  static const struct v4l2_subdev_ops ov6650_subdev_ops = {
> 

-- 
Regards
--
Kieran
