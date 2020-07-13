Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A67121D35E
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2020 12:03:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729588AbgGMKD2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jul 2020 06:03:28 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:44787 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726523AbgGMKD1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jul 2020 06:03:27 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id uvIwj6dSlGLmCuvIzjAv4p; Mon, 13 Jul 2020 12:03:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1594634605; bh=JZ0u6IVYJ3t6A5I0FiTBQH+7zjb770/fle7atpAVCzs=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=FdED5WFnNNxHgJOQ5hMxpOAdDav4DkMFqmX2rh8kqXVBRvBg6xZmoTXN3A+fPcH8f
         hZ2lZ5oQ+rIBr6fSK1NWaTL3tEm3ciEeo2XsxVTg7jqosxzroC+i2TFxKeLdk8CE0E
         HiSZOHl9i4jgrOppQbtxy2WXs9nXq98I8augJvQR0Bwm8GPXsIIc7HbiZJHuKR9r6d
         +5stJHF8lm0r1SgL3DO+mLWXU5kvoy2L+AYaWogtEx+Z69MDyk5xyPp/O/oM0I8V5N
         Yl+Hfk/eMpbHj3YMT03+pd+4rAyIhIuTvy7BNti4xzusBgXdwMtA7DJdsrACA4KBKs
         GIBALBr20T7BA==
Subject: Re: [PATCH v1 3/6] [media] cx25821: use generic power management
To:     Vaibhav Gupta <vaibhavgupta40@gmail.com>,
        Bjorn Helgaas <helgaas@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, bjorn@helgaas.com,
        Vaibhav Gupta <vaibhav.varodek@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        skhan@linuxfoundation.org
References: <20200629073604.205478-1-vaibhavgupta40@gmail.com>
 <20200629073604.205478-4-vaibhavgupta40@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <126d8fe6-1480-137c-ac64-d828a32b99f9@xs4all.nl>
Date:   Mon, 13 Jul 2020 12:03:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200629073604.205478-4-vaibhavgupta40@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfFiuY3g36s+/lIFf8CRg5WvA6XQU+S7/+hihune9u/ukz+XXtQn0TrUcq5itDVbjWDM+5qoFf1B+Uz8z8GJsH6bfd8Mic/MwYp9w1q/yvaKUQmRBOfxh
 hkQI37AksyhAQFB2A315MaOXpkzTzKmcqGQy5DwsPAVp6kwFYYSjFnvMSdkGuLZ55KdCj5W4YkQGiny8ejEdv3Dsg72Go6kGjVgTheWacfPMBtSRSfmVDPOS
 AO12fd2Ogjry+oCJpHNTDOiBJTVhWOUbXpHHGz07HgzUMlAlpmpk3jI0cWXRZFy/O65GHnS5Q1bOgKlYO7tSywQttExU0vbn71cPstiaxjhPKiNjB78U8c0G
 Pf/Yk4hEYGHkHHm/5qugLvNw8Lxcy17KLO8w0DXVN9ib6gmgnk8522/6SpRuKHeGiobxcnMfDri+cUhYKnszwIc7iVZFWDyWoA6HFjkDYRLluXmjg71c93Ql
 m80gBTFhNn6JbA/3iKKpGnKZ3VuViHqIWuPjcIxC3lRJ9SQ5m61E4l/0how=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 29/06/2020 09:36, Vaibhav Gupta wrote:
> The .suspend() and .resume() callbacks are not defined for this driver.
> Still, their power managemgement stucture can be easily upgraded to
> gemeric, without affecting its normal behaviour.
> 
> Hence, define them NULL and use struct dev_pm_ops type to bind them.
> 
> Compile-tested only.
> 
> Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
> ---
>  drivers/media/pci/cx25821/cx25821-core.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/pci/cx25821/cx25821-core.c b/drivers/media/pci/cx25821/cx25821-core.c
> index 41be22ce66f3..59501939d741 100644
> --- a/drivers/media/pci/cx25821/cx25821-core.c
> +++ b/drivers/media/pci/cx25821/cx25821-core.c
> @@ -1369,14 +1369,18 @@ static const struct pci_device_id cx25821_pci_tbl[] = {
>  
>  MODULE_DEVICE_TABLE(pci, cx25821_pci_tbl);
>  
> +#define cx25821_suspend NULL
> +#define cx25821_resume NULL
> +
> +static SIMPLE_DEV_PM_OPS(cx25821_pm_ops, cx25821_suspend, cx25821_resume);
> +
>  static struct pci_driver cx25821_pci_driver = {
>  	.name = "cx25821",
>  	.id_table = cx25821_pci_tbl,
>  	.probe = cx25821_initdev,
>  	.remove = cx25821_finidev,
>  	/* TODO */
> -	.suspend = NULL,
> -	.resume = NULL,
> +	.driver.pm = &cx25821_pm_ops,
>  };

Same question as for 2/6.

Regards,

	Hans

>  
>  static int __init cx25821_init(void)
> 

