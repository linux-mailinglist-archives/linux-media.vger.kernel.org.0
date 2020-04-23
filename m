Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA1791B5724
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2020 10:19:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726453AbgDWITh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Apr 2020 04:19:37 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:35117 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726027AbgDWITh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Apr 2020 04:19:37 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id RX51jKqzf7xncRX54jPirO; Thu, 23 Apr 2020 10:19:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1587629975; bh=6Qwjrk58nRdGC9EMw/dOUdO16jo9zBCCMoVwspAGboU=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=iEN5aVxF2tEtzww2N98k0CxnDDw4uJIKInjM7yXca88yZFVFmbjeDDi5lQy8DI/oN
         2UTF8nNw/YrNFMnCIhwLTuVOcGuG/ojD14WWmff3Hwu4TA+46swdTeUW6g2Ph7cp9k
         oQ9Nwf3245r+M0lKAkTvy3ngUxRfKljdixtKyokvVGT5CWn8rbnrnfw59xBt+H60cN
         uZkFuAhDXQ+qfvhvYaYnVbB08H9Ic9e0DqFoZIye0pleG8PePP+0WtI97egVrAWLny
         sRdZ61/pXiqClY96rIna622nYKb3M1j6YM7qrBikVAawg/gVTt+2bWJ4k6Em4MwoIk
         Xjy251zpyHbew==
Subject: Re: [PATCH 01/12] utils: fix compilation with C++98
To:     Rosen Penev <rosenp@gmail.com>, linux-media@vger.kernel.org
References: <20200422003735.3891-1-rosenp@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <5cf49918-bff9-d97b-701b-7ece6e1ae0a5@xs4all.nl>
Date:   Thu, 23 Apr 2020 10:19:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200422003735.3891-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfJvctoAcDDZMoEimRUpZ5+shbeXIxajshg3aCnBswLZOJZS4MIUlAZP7tE5CbJqXnbp/kVn8XVPf+baB2dmJTcp4amU93VGKIcjbbTc8S5DDzqK+1SC0
 TJlV92iBDG/cyga1nxSKJ8Jg2zCCICi4V46/qXCJVjYkLHYOx7Hh4arDgFWWm4sYTMpuqcSrrzrVv68A96ClHm3A4GZ6d2mwD74=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22/04/2020 02:37, Rosen Penev wrote:
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  utils/cec-compliance/cec-test.cpp | 4 ++--
>  utils/rds-ctl/rds-ctl.cpp         | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/utils/cec-compliance/cec-test.cpp b/utils/cec-compliance/cec-test.cpp
> index 032ff5ad..cc07998a 100644
> --- a/utils/cec-compliance/cec-test.cpp
> +++ b/utils/cec-compliance/cec-test.cpp
> @@ -908,7 +908,7 @@ static int tuner_ctl_test(struct node *node, unsigned me, unsigned la, bool inte
>  		cec_msg_give_tuner_device_status(&msg, true, CEC_OP_STATUS_REQ_ONCE);
>  		fail_on_test(!transmit_timeout(node, &msg));
>  		fail_on_test(timed_out_or_abort(&msg));
> -		info = {};
> +		memset(&info, 0, sizeof(info));
>  		cec_ops_tuner_device_status(&msg, &info);
>  		if (!memcmp(&info, &info_vec[0], sizeof(info)))
>  			break;
> @@ -935,7 +935,7 @@ static int tuner_ctl_test(struct node *node, unsigned me, unsigned la, bool inte
>  		cec_msg_give_tuner_device_status(&msg, true, CEC_OP_STATUS_REQ_ONCE);
>  		fail_on_test(!transmit_timeout(node, &msg));
>  		fail_on_test(timed_out_or_abort(&msg));
> -		info = {};
> +		memset(&info, 0, sizeof(info));
>  		cec_ops_tuner_device_status(&msg, &info);
>  		if (memcmp(&info, &(*iter), sizeof(info))) {
>  			log_tuner_service(info);
> diff --git a/utils/rds-ctl/rds-ctl.cpp b/utils/rds-ctl/rds-ctl.cpp
> index 0511fe5d..0e497b2a 100644
> --- a/utils/rds-ctl/rds-ctl.cpp
> +++ b/utils/rds-ctl/rds-ctl.cpp
> @@ -918,7 +918,7 @@ static void get_options(const int fd, const int capabilities, struct v4l2_freque
>  				printf("\tFrequency range      : %.1f MHz - %.1f MHz\n",
>  					 vt.rangelow / 16.0, vt.rangehigh / 16.0);
>  			printf("\tSignal strength/AFC  : %ld%%/%d\n",
> -				std::lround(vt.signal / 655.35), vt.afc);
> +				lround(vt.signal / 655.25), vt.afc);

v4l2-ctl-tuner.cpp also uses std::lround, but that one isn't changed back.

Is rds-ctl.cpp perhaps just missing a header?

Regards,

	Hans

>  			printf("\tCurrent audio mode   : %s\n", audmode2s(vt.audmode));
>  			printf("\tAvailable subchannels: %s\n",
>  					rxsubchans2s(vt.rxsubchans).c_str());
> 

