Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FDE03771E1
	for <lists+linux-media@lfdr.de>; Sat,  8 May 2021 14:47:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230483AbhEHMsC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 8 May 2021 08:48:02 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:56790 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230419AbhEHMsC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 8 May 2021 08:48:02 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 148Ck2dr195991;
        Sat, 8 May 2021 12:46:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=dQLKDQcKr1hFvTAPqe1ScZ6M97IWge/GLE2pIbxQwb0=;
 b=o0khWlPDYWHGI+tqiQKHb8kIXUdlFgZ0Rc1Qjp4hLWeQDg0mJWwnmscG/saGWidGCis5
 gP6NdI0T6o2vZ9DpCP57X5ZdudpicvGwvD1/wPPbyXS+4WMGPVVyF5+SMoTLX9np06PT
 UV1vu9qF0NAH5lV1RNhw1ontcYNioN+UGolzgmKD5pifrS0NrLRyP6BEyny7ZmzbCr/2
 KGj/ajBMNSRfHD7t2qEyUfvRgOOyJBxKTPOZxRxnPVKFMHqB9tCBYjpr64RntCJkoV9q
 EC/IAmWT4IWnZU/f9AQ/KsHTs8AaVLRQCXYpM+FqxTKEOU8tN6U1asjRS+U4q9dpAnC6 rg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2130.oracle.com with ESMTP id 38dj2r0e79-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 08 May 2021 12:46:56 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 148CTb5P063390;
        Sat, 8 May 2021 12:46:55 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by aserp3030.oracle.com with ESMTP id 38dgpcrd7m-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 08 May 2021 12:46:55 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 148CktiI095491;
        Sat, 8 May 2021 12:46:55 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3030.oracle.com with ESMTP id 38dgpcrd7g-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 08 May 2021 12:46:55 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 148CksN1015700;
        Sat, 8 May 2021 12:46:54 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Sat, 08 May 2021 05:46:53 -0700
Date:   Sat, 8 May 2021 15:46:30 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Pavel Skripkin <paskripkin@gmail.com>, mchehab@kernel.org
Cc:     Uladzislau Rezki <urezki@gmail.com>, linux-usb@vger.kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] WARNING in __vmalloc_node_range
Message-ID: <20210508124630.GN1922@kadam>
References: <000000000000fdc0be05c1a6d68f@google.com>
 <20210506142210.GA37570@pc638.lan>
 <20210506145722.GC1955@kadam>
 <20210506180053.4770f495@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210506180053.4770f495@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-ORIG-GUID: Ln0t5G_yt0lQXANV2KM8ByDwxgj5nXxn
X-Proofpoint-GUID: Ln0t5G_yt0lQXANV2KM8ByDwxgj5nXxn
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9977 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015 spamscore=0
 suspectscore=0 mlxscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105080093
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I wrote a Smatch check to see if there were more of these and here are
the other issues that it found.  (I will expant this check to more types
on Monday).

drivers/media/usb/dvb-usb-v2/lmedm04.c:1196 (null)() warn: element count is wrong 'lme2510_props.num_adapters=0' vs 'lme2510_props.adapter=2'
drivers/media/usb/dvb-usb-v2/af9035.c:1997 (null)() warn: element count is wrong 'af9035_props.num_adapters=0' vs 'af9035_props.adapter=2'
drivers/media/usb/dvb-usb-v2/af9035.c:2043 (null)() warn: element count is wrong 'it930x_props.num_adapters=0' vs 'it930x_props.adapter=2'
drivers/media/usb/dvb-usb-v2/af9015.c:1409 (null)() warn: element count is wrong 'af9015_props.num_adapters=0' vs 'af9015_props.adapter=2'
drivers/media/usb/dvb-usb/dtt200u.c:384 (null)() warn: element count is wrong 'wt220u_miglia_properties.num_adapters=1' vs 'wt220u_miglia_properties.adapter=0'

As far as I can see these are initialized in dvb_usb_adapter_init()
where the loop is:

	for (n = 0; n < d->props.num_adapters; n++) {

So it looks like all of these are genuine bugs.  But I'm not a subsystem
expert and can't test them.  These line numbers are from linux-next.

Btw, here are the other element/count pairings I was able to find which
I'm going to test on Monday.

ath5k_gain_opt, go_steps_count, go_step
atomisp_camera_caps, sensor_num, sensor
brcmf_rssi_event_le, rssi_level_num, rssi_levels
catpt_stream_template, num_entries, entries
dvb_usb_device_properties, num_adapters, adapter
dvb_usb_device_properties, num_device_descs, devices
go7007_board_info, num_inputs, inputs
hda_input_mux, num_items, items
idt_89hpes_cfg, port_cnt, ports
mipi_phy_device_desc, num_regmaps, regmap_names
mtk_thermal_data, need_switch_bank, bank_data
mwifiex_sdio_card_reg, func1_spec_reg_num, func1_spec_reg_table
nft_chain_type, hook_mask, hooks
PWR_DFY_Section, dfy_size, dfy_data
rkisp1_cif_isp_afc_config, num_afm_win, afm_win
scarlett_device_info, num_controls, controls
snd_soc_acpi_codecs, num_codecs, codecs
timb_dma_platform_data, nr_channels, channels
uniphier_u3hsphy_soc_data, nparams, param
uniphier_u3ssphy_soc_data, nparams, param
venus_resources, vcodec_clks_num, vcodec_pmdomains

regards,
dan carpenter

