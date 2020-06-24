Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADB552072C6
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2020 14:05:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390041AbgFXME4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jun 2020 08:04:56 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:39417 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388522AbgFXME4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jun 2020 08:04:56 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id o493ju2n0x3Ajo496jjKoK; Wed, 24 Jun 2020 14:04:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1593000293; bh=PiKVba03XEk87JSU9wAB4cyFQf3xBDIadjtktZ1G4m8=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=HjVGcQ9u7mHkoBRxM/kmERQO2BFIoUaFyUTJjNCqDiVpPtdbFmu2ga52d8oTKMWrf
         HZMbcm/2oWH/7SX+k3fOYfgV6V9IO7n4euxcHm8vFEJU/dOiIOIz3kmjGYkh9IHFOP
         rIdknvhPfpR2sSfypufPdXTppK7ue2Z9M6PD22rHkC/Gzd6WMNfLe5GNE67wjhWpvW
         Tl+w5nFbQzNgB0CAf6bb6zopvDXwlttYLZhTLA2LYaM8JfhwSjlrR6GhTiAMwmge1D
         zM5LNUSViuihkXP2rrcBTFN4VGTvFH6CDX6P6He7QTZj3oFLo9utrBzlnWukxU3fpa
         FYBG2H9IQU7+Q==
Subject: Re: [PATCH v2 15/17] media: cros-ec-cec: Use cros_ec_cmd()
To:     Prashant Malani <pmalani@chromium.org>,
        linux-kernel@vger.kernel.org
Cc:     kbuild test robot <lkp@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Sebastian Reichel <sre@kernel.org>,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>
References: <20200205190028.183069-1-pmalani@chromium.org>
 <20200205190028.183069-16-pmalani@chromium.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <9f4cd932-c7ec-c755-17f3-503327450256@xs4all.nl>
Date:   Wed, 24 Jun 2020 14:04:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200205190028.183069-16-pmalani@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfKQpS1I0B/qMvD15NGvod0w0zHQ3gqPbjQYpqjAOEFCWwyEG/zXbBTP7KvsXD4c/nq3FTVGhd/eYhQmdirT5EgkmDOKATP6GByn2LzrTURY31/CJHt0G
 SSykfn0ef9Z1nLjfngGe1MW5dKbSlGp1KZ8HMf6OjhR1TCurBmDkCMnUP2/vVTAhZcHixgFVbo3uQpEDKd6B5NLn5LsbKqFbKKeheYYuBePZSnphcPIu0off
 KQ+hkpMO3crG4JnFOCLNPkPIAkcHFNPGN22l/chR3OlcCKcGjvyjj2uTe/OBqvXRXB1uOmDN4gcUmivzWDNNbB8+CG1wYDgVbweNJR3aNHcNoQy5mio+aITF
 PjXEttFL7IzrhbElO3KF4IQeTb8nnfGKbH7Zp2Nh54pq5P7wPUfVoQGjidZWWKCGglOof7egrVdG69L33Zhf0GFskyiRcPwn0e7wtRZpLPVzGZ+mMWBPnDFJ
 nnIeokPhZWXKtERO1//Q0Clxozu1NoLpZG2fCK3DMFD7LU0kWH3vh1QfRfk=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Prashant,

On 05/02/2020 20:00, Prashant Malani wrote:
> Replace cros_ec_cmd_xfer_status() with cros_ec_cmd() which does the
> message buffer setup and cleanup, but is located in platform/chrome
> and used by other drivers.
> 
> Signed-off-by: Prashant Malani <pmalani@chromium.org>
> Reported-by: kbuild test robot <lkp@intel.com>

This source has moved to drivers/media/cec/platform/cros-ec/cros-ec-cec.c.

Can you rebase/repost?

Regards,

	Hans

> ---
> 
> Changes in v2:
> - Updated to use new function name and parameter list.
> - Used C99 element setting to initialize struct.
> 
>  .../media/platform/cros-ec-cec/cros-ec-cec.c  | 45 +++++++------------
>  1 file changed, 16 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/media/platform/cros-ec-cec/cros-ec-cec.c b/drivers/media/platform/cros-ec-cec/cros-ec-cec.c
> index 0e7e2772f08f96..a462af1c9ae04b 100644
> --- a/drivers/media/platform/cros-ec-cec/cros-ec-cec.c
> +++ b/drivers/media/platform/cros-ec-cec/cros-ec-cec.c
> @@ -93,18 +93,14 @@ static int cros_ec_cec_set_log_addr(struct cec_adapter *adap, u8 logical_addr)
>  {
>  	struct cros_ec_cec *cros_ec_cec = adap->priv;
>  	struct cros_ec_device *cros_ec = cros_ec_cec->cros_ec;
> -	struct {
> -		struct cros_ec_command msg;
> -		struct ec_params_cec_set data;
> -	} __packed msg = {};
> +	struct ec_params_cec_set data = {
> +		.cmd = CEC_CMD_LOGICAL_ADDRESS,
> +		.val = logical_addr,
> +	};
>  	int ret;
>  
> -	msg.msg.command = EC_CMD_CEC_SET;
> -	msg.msg.outsize = sizeof(msg.data);
> -	msg.data.cmd = CEC_CMD_LOGICAL_ADDRESS;
> -	msg.data.val = logical_addr;
> -
> -	ret = cros_ec_cmd_xfer_status(cros_ec, &msg.msg);
> +	ret = cros_ec_cmd(cros_ec, 0, EC_CMD_CEC_SET, &data, sizeof(data),
> +			  NULL, 0, NULL);
>  	if (ret < 0) {
>  		dev_err(cros_ec->dev,
>  			"error setting CEC logical address on EC: %d\n", ret);
> @@ -119,17 +115,12 @@ static int cros_ec_cec_transmit(struct cec_adapter *adap, u8 attempts,
>  {
>  	struct cros_ec_cec *cros_ec_cec = adap->priv;
>  	struct cros_ec_device *cros_ec = cros_ec_cec->cros_ec;
> -	struct {
> -		struct cros_ec_command msg;
> -		struct ec_params_cec_write data;
> -	} __packed msg = {};
> +	struct ec_params_cec_write data = {};
>  	int ret;
>  
> -	msg.msg.command = EC_CMD_CEC_WRITE_MSG;
> -	msg.msg.outsize = cec_msg->len;
> -	memcpy(msg.data.msg, cec_msg->msg, cec_msg->len);
> -
> -	ret = cros_ec_cmd_xfer_status(cros_ec, &msg.msg);
> +	memcpy(data.msg, cec_msg->msg, cec_msg->len);
> +	ret = cros_ec_cmd(cros_ec, 0, EC_CMD_CEC_WRITE_MSG, &data,
> +			  sizeof(cec_msg->len), NULL, 0, NULL);
>  	if (ret < 0) {
>  		dev_err(cros_ec->dev,
>  			"error writing CEC msg on EC: %d\n", ret);
> @@ -143,18 +134,14 @@ static int cros_ec_cec_adap_enable(struct cec_adapter *adap, bool enable)
>  {
>  	struct cros_ec_cec *cros_ec_cec = adap->priv;
>  	struct cros_ec_device *cros_ec = cros_ec_cec->cros_ec;
> -	struct {
> -		struct cros_ec_command msg;
> -		struct ec_params_cec_set data;
> -	} __packed msg = {};
> +	struct ec_params_cec_set data = {
> +		.cmd = CEC_CMD_ENABLE,
> +		.val = enable,
> +	};
>  	int ret;
>  
> -	msg.msg.command = EC_CMD_CEC_SET;
> -	msg.msg.outsize = sizeof(msg.data);
> -	msg.data.cmd = CEC_CMD_ENABLE;
> -	msg.data.val = enable;
> -
> -	ret = cros_ec_cmd_xfer_status(cros_ec, &msg.msg);
> +	ret = cros_ec_cmd(cros_ec, 0, EC_CMD_CEC_SET, &data, sizeof(data),
> +			  NULL, 0, NULL);
>  	if (ret < 0) {
>  		dev_err(cros_ec->dev,
>  			"error %sabling CEC on EC: %d\n",
> 

