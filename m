Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ADC8614851
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2019 12:26:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725981AbfEFK0g (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 May 2019 06:26:36 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:40702 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725883AbfEFK0g (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 May 2019 06:26:36 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x46AIvBj034896;
        Mon, 6 May 2019 10:26:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type : in-reply-to;
 s=corp-2018-07-02; bh=6tzxzcTc/aqne9cPRGeSKcpQM5kD6ysk+yLi19TTFts=;
 b=vNw6lfQt9QAB6vRvb5Y7x+cCAYz06O6DH27saqT9yWqXTBF4JwytEseiwEivc65I4KDE
 jaoXwG1GYhQFEAtodTPLrIjEB+BrCe3Y9+p0vn2vyq4UEl97dGmdS0C+YC4V9GhDyqlQ
 1b7UKMynmLWw2RSyLudehMb0cuvy/9MvuDF7hUKP2RXmsmnt0EuUcErBY8ABX18P4REn
 lXRYDeQ7XY6jQgZ9N39PYppGyJkTMvP6ery8mT7v50iHAzwO+TY0WeXPV24yrWbC5LWK
 n0Xo6wBRRhAaJyef49muGVgFr+IH+uDof6zn5swPMb/tCA5xEm4QL8bjIveCk/G/Nbth XQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2130.oracle.com with ESMTP id 2s94bfnmg5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 06 May 2019 10:26:27 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x46ANqKO193300;
        Mon, 6 May 2019 10:24:27 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3030.oracle.com with ESMTP id 2sagyt9sas-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 06 May 2019 10:24:27 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x46AONan030405;
        Mon, 6 May 2019 10:24:24 GMT
Received: from kadam (/105.52.123.240)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 06 May 2019 03:24:23 -0700
Date:   Mon, 6 May 2019 13:24:12 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     kbuild@01.org, Michael Tretter <m.tretter@pengutronix.de>
Cc:     kbuild-all@01.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, kernel@pengutronix.de,
        robh+dt@kernel.org, mchehab@kernel.org, tfiga@chromium.org,
        dshah@xilinx.com, hverkuil@xs4all.nl,
        Michael Tretter <m.tretter@pengutronix.de>
Subject: Re: [PATCH v5 5/5] [media] allegro: add SPS/PPS nal unit writer
Message-ID: <20190506102412.GR2239@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190503122010.16663-6-m.tretter@pengutronix.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9248 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905060091
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9248 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905060091
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Michael,

url:    https://github.com/0day-ci/linux/commits/Michael-Tretter/Add-ZynqMP-VCU-Allegro-DVT-H-264-encoder-driver/20190504-161958
base:   git://linuxtv.org/media_tree.git master

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/media/platform/allegro-dvt/nal-h264.c:205 rbsp_read_bit() warn: signedness bug returning '(-22)'
drivers/media/platform/allegro-dvt/nal-h264.c:259 rbsp_read_bits() warn: unsigned 'bit' is never less than zero.

# https://github.com/0day-ci/linux/commit/eba69588199f08008a1fb4ad24e1f3e66d0080e3
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout eba69588199f08008a1fb4ad24e1f3e66d0080e3
vim +205 drivers/media/platform/allegro-dvt/nal-h264.c

eba69588 Michael Tretter 2019-05-03  188  
eba69588 Michael Tretter 2019-05-03  189  static inline bool rbsp_read_bit(struct rbsp *rbsp)
                                                        ^^^^
eba69588 Michael Tretter 2019-05-03  190  {
eba69588 Michael Tretter 2019-05-03  191  	int shift;
eba69588 Michael Tretter 2019-05-03  192  	int ofs;
eba69588 Michael Tretter 2019-05-03  193  	bool bit;
eba69588 Michael Tretter 2019-05-03  194  	int err;
eba69588 Michael Tretter 2019-05-03  195  
eba69588 Michael Tretter 2019-05-03  196  	if (rbsp->num_consecutive_zeros == 22) {
eba69588 Michael Tretter 2019-05-03  197  		err = discard_emulation_prevention_three_byte(rbsp);
eba69588 Michael Tretter 2019-05-03  198  		if (err)
eba69588 Michael Tretter 2019-05-03  199  			return err;
                                                                ^^^^^^^^^^

eba69588 Michael Tretter 2019-05-03  200  	}
eba69588 Michael Tretter 2019-05-03  201  
eba69588 Michael Tretter 2019-05-03  202  	shift = 7 - (rbsp->pos % 8);
eba69588 Michael Tretter 2019-05-03  203  	ofs = rbsp->pos / 8;
eba69588 Michael Tretter 2019-05-03  204  	if (ofs >= rbsp->size)
eba69588 Michael Tretter 2019-05-03 @205  		return -EINVAL;
                                                        ^^^^^^^^^^^^^^
Probably this function should return int instead of bool.

eba69588 Michael Tretter 2019-05-03  206  
eba69588 Michael Tretter 2019-05-03  207  	bit = (rbsp->data[ofs] >> shift) & 1;
eba69588 Michael Tretter 2019-05-03  208  
eba69588 Michael Tretter 2019-05-03  209  	rbsp->pos++;
eba69588 Michael Tretter 2019-05-03  210  
eba69588 Michael Tretter 2019-05-03  211  	if (bit == 1 ||
eba69588 Michael Tretter 2019-05-03  212  	    (rbsp->num_consecutive_zeros < 7 && (rbsp->pos % 8 == 0)))
eba69588 Michael Tretter 2019-05-03  213  		rbsp->num_consecutive_zeros = 0;
eba69588 Michael Tretter 2019-05-03  214  	else
eba69588 Michael Tretter 2019-05-03  215  		rbsp->num_consecutive_zeros++;
eba69588 Michael Tretter 2019-05-03  216  
eba69588 Michael Tretter 2019-05-03  217  	return bit;
eba69588 Michael Tretter 2019-05-03  218  }

[ snip ]

eba69588 Michael Tretter 2019-05-03  248  static inline int rbsp_read_bits(struct rbsp *rbsp, int n, unsigned int *value)
eba69588 Michael Tretter 2019-05-03  249  {
eba69588 Michael Tretter 2019-05-03  250  	int i;
eba69588 Michael Tretter 2019-05-03  251  	unsigned int bit;
                                                ^^^^^^^^^^^^^^^^

eba69588 Michael Tretter 2019-05-03  252  	unsigned int tmp = 0;
eba69588 Michael Tretter 2019-05-03  253  
eba69588 Michael Tretter 2019-05-03  254  	if (n > 8 * sizeof(*value))
eba69588 Michael Tretter 2019-05-03  255  		return -EINVAL;
eba69588 Michael Tretter 2019-05-03  256  
eba69588 Michael Tretter 2019-05-03  257  	for (i = n; i > 0; i--) {
eba69588 Michael Tretter 2019-05-03  258  		bit = rbsp_read_bit(rbsp);
eba69588 Michael Tretter 2019-05-03 @259  		if (bit < 0)
                                                            ^^^^^^^

eba69588 Michael Tretter 2019-05-03  260  			return bit;
eba69588 Michael Tretter 2019-05-03  261  		tmp |= bit << (i - 1);
eba69588 Michael Tretter 2019-05-03  262  	}
eba69588 Michael Tretter 2019-05-03  263  
eba69588 Michael Tretter 2019-05-03  264  	if (value)
eba69588 Michael Tretter 2019-05-03  265  		*value = tmp;
eba69588 Michael Tretter 2019-05-03  266  
eba69588 Michael Tretter 2019-05-03  267  	return 0;
eba69588 Michael Tretter 2019-05-03  268  }
eba69588 Michael Tretter 2019-05-03  269  

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
