Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C255312684
	for <lists+linux-media@lfdr.de>; Sun,  7 Feb 2021 18:58:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229638AbhBGR5n (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 7 Feb 2021 12:57:43 -0500
Received: from mga14.intel.com ([192.55.52.115]:26843 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229510AbhBGR5m (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 7 Feb 2021 12:57:42 -0500
IronPort-SDR: MmpQHItXH5S/7KtmvDcUQA8VzOLVn47E1cQpwsyGYr0Kxh0tG7ayr9XgA+FspfpEq7+jZbnf7n
 BWapSmftb8cA==
X-IronPort-AV: E=McAfee;i="6000,8403,9888"; a="180848186"
X-IronPort-AV: E=Sophos;i="5.81,160,1610438400"; 
   d="gz'50?scan'50,208,50";a="180848186"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2021 09:56:59 -0800
IronPort-SDR: CwW/BC6KZTOn9/cL9DycyLQ350gx7Q9nhHfHKLhZnpQ5GjDro1OR8CfH1O2k4/5mLBfiYdS29N
 NS0eW9qMxIqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,160,1610438400"; 
   d="gz'50?scan'50,208,50";a="435324977"
Received: from lkp-server02.sh.intel.com (HELO 8b832f01bb9c) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 07 Feb 2021 09:56:57 -0800
Received: from kbuild by 8b832f01bb9c with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1l8oIq-00030F-FW; Sun, 07 Feb 2021 17:56:56 +0000
Date:   Mon, 8 Feb 2021 01:56:51 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Cc:     kbuild-all@lists.01.org, clang-built-linux@googlegroups.com,
        linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: drivers/media/test-drivers/vidtv/vidtv_psi.c:667:31: warning: taking
 address of packed member 'bitfield2' of class or structure
 'vidtv_psi_table_pmt' may result in an unaligned pointer value
Message-ID: <202102080148.SqEA3ItP-lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="BOKacYhQ+x31HxR3"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--BOKacYhQ+x31HxR3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Daniel,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   61556703b610a104de324e4f061dc6cf7b218b46
commit: f90cf6079bf67988f8b1ad1ade70fc89d0080905 media: vidtv: add a bridge driver
date:   5 months ago
config: mips-randconfig-r032-20210207 (attached as .config)
compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project c9439ca36342fb6013187d0a69aef92736951476)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f90cf6079bf67988f8b1ad1ade70fc89d0080905
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout f90cf6079bf67988f8b1ad1ade70fc89d0080905
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=mips 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/media/test-drivers/vidtv/vidtv_psi.c:667:31: warning: taking address of packed member 'bitfield2' of class or structure 'vidtv_psi_table_pmt' may result in an unaligned pointer value [-Waddress-of-packed-member]
           vidtv_psi_set_desc_loop_len(&pmt->bitfield2, desc_loop_len, 10);
                                        ^~~~~~~~~~~~~~
>> drivers/media/test-drivers/vidtv/vidtv_psi.c:678:32: warning: taking address of packed member 'bitfield2' of class or structure 'vidtv_psi_table_pmt_stream' may result in an unaligned pointer value [-Waddress-of-packed-member]
                   vidtv_psi_set_desc_loop_len(&s->bitfield2, desc_loop_len, 10);
                                                ^~~~~~~~~~~~
>> drivers/media/test-drivers/vidtv/vidtv_psi.c:710:32: warning: taking address of packed member 'bitfield' of class or structure 'vidtv_psi_table_sdt_service' may result in an unaligned pointer value [-Waddress-of-packed-member]
                   vidtv_psi_set_desc_loop_len(&s->bitfield, desc_loop_len, 12);
                                                ^~~~~~~~~~~
   drivers/media/test-drivers/vidtv/vidtv_psi.c:97:19: warning: unused function 'vidtv_psi_sdt_serv_get_desc_loop_len' [-Wunused-function]
   static inline u16 vidtv_psi_sdt_serv_get_desc_loop_len(struct vidtv_psi_table_sdt_service *s)
                     ^
   drivers/media/test-drivers/vidtv/vidtv_psi.c:112:19: warning: unused function 'vidtv_psi_pmt_stream_get_desc_loop_len' [-Wunused-function]
   static inline u16 vidtv_psi_pmt_stream_get_desc_loop_len(struct vidtv_psi_table_pmt_stream *s)
                     ^
   drivers/media/test-drivers/vidtv/vidtv_psi.c:127:19: warning: unused function 'vidtv_psi_pmt_get_desc_loop_len' [-Wunused-function]
   static inline u16 vidtv_psi_pmt_get_desc_loop_len(struct vidtv_psi_table_pmt *p)
                     ^
   6 warnings generated.
--
>> drivers/media/test-drivers/vidtv/vidtv_channel.c:133:27: warning: taking address of packed member 'descriptor' of class or structure 'vidtv_psi_table_sdt_service' may result in an unaligned pointer value [-Waddress-of-packed-member]
                           vidtv_psi_desc_assign(&tail->descriptor, desc);
                                                  ^~~~~~~~~~~~~~~~
>> drivers/media/test-drivers/vidtv/vidtv_channel.c:231:29: warning: taking address of packed member 'descriptor' of class or structure 'vidtv_psi_table_pmt_stream' may result in an unaligned pointer value [-Waddress-of-packed-member]
                                           vidtv_psi_desc_assign(&tail->descriptor, desc);
                                                                  ^~~~~~~~~~~~~~~~
   2 warnings generated.


vim +667 drivers/media/test-drivers/vidtv/vidtv_psi.c

   655	
   656	void vidtv_psi_pmt_table_update_sec_len(struct vidtv_psi_table_pmt *pmt)
   657	{
   658		/* see ISO/IEC 13818-1 : 2000 p.46 */
   659		u16 length = 0;
   660		struct vidtv_psi_table_pmt_stream *s = pmt->stream;
   661		u16 desc_loop_len;
   662	
   663		/* from immediately after 'section_length' until 'program_info_length'*/
   664		length += PMT_LEN_UNTIL_PROGRAM_INFO_LENGTH;
   665	
   666		desc_loop_len = vidtv_psi_desc_comp_loop_len(pmt->descriptor);
 > 667		vidtv_psi_set_desc_loop_len(&pmt->bitfield2, desc_loop_len, 10);
   668	
   669		length += desc_loop_len;
   670	
   671		while (s) {
   672			/* skip both pointers at the end */
   673			length += sizeof(struct vidtv_psi_table_pmt_stream) -
   674				  sizeof(struct vidtv_psi_desc *) -
   675				  sizeof(struct vidtv_psi_table_pmt_stream *);
   676	
   677			desc_loop_len = vidtv_psi_desc_comp_loop_len(s->descriptor);
 > 678			vidtv_psi_set_desc_loop_len(&s->bitfield2, desc_loop_len, 10);
   679	
   680			length += desc_loop_len;
   681	
   682			s = s->next;
   683		}
   684	
   685		length += CRC_SIZE_IN_BYTES;
   686	
   687		vidtv_psi_set_sec_len(&pmt->header, length);
   688	}
   689	
   690	void vidtv_psi_sdt_table_update_sec_len(struct vidtv_psi_table_sdt *sdt)
   691	{
   692		/* see ETSI EN 300 468 V 1.10.1 p.24 */
   693		u16 length = 0;
   694		struct vidtv_psi_table_sdt_service *s = sdt->service;
   695		u16 desc_loop_len;
   696	
   697		/*
   698		 * from immediately after 'section_length' until
   699		 * 'reserved_for_future_use'
   700		 */
   701		length += SDT_LEN_UNTIL_RESERVED_FOR_FUTURE_USE;
   702	
   703		while (s) {
   704			/* skip both pointers at the end */
   705			length += sizeof(struct vidtv_psi_table_sdt_service) -
   706				  sizeof(struct vidtv_psi_desc *) -
   707				  sizeof(struct vidtv_psi_table_sdt_service *);
   708	
   709			desc_loop_len = vidtv_psi_desc_comp_loop_len(s->descriptor);
 > 710			vidtv_psi_set_desc_loop_len(&s->bitfield, desc_loop_len, 12);
   711	
   712			length += desc_loop_len;
   713	
   714			s = s->next;
   715		}
   716	
   717		length += CRC_SIZE_IN_BYTES;
   718	
   719		vidtv_psi_set_sec_len(&sdt->header, length);
   720	}
   721	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--BOKacYhQ+x31HxR3
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

H4sICE4mIGAAAy5jb25maWcAlFxZc+O2sn7Pr1AlVbdyqrLI8n5v+QEEQRERSXAAUJL9wlJs
zUT32JJLlrP8+9MNbgAJeuakUsmou7E3ur9uNOeH736YkPfT4WVz2j1unp//mXzZ7rfHzWn7
NPm8e97+3yQUk0zoCQu5/gWEk93+/e9fX3avb5PLX25/mf58fLyYLLbH/fZ5Qg/7z7sv79B6
d9h/98N3VGQRn5eUlksmFRdZqdla333/+LzZf5n8uT2+gdzkbPbL9Jfp5Mcvu9P//vor/Pdl
dzwejr8+P//5Ur4eD/+/fTxNHm8vzm8fN+dX5xezz79fTc/Oz26un6abq9vN9vPt7Pr86vby
7OL66l/fN6POu2Hvpg0xCYc0kOOqpAnJ5nf/WIJATJKwIxmJtvnZbAr/WH3ERJVEpeVcaGE1
chmlKHReaC+fZwnPmMUSmdKyoFpI1VG5/FSuhFx0lKDgSah5ykpNgoSVSkgcAPb/h8ncHObz
5G17en/tToRnXJcsW5ZEwlJ5yvXd+QzE25HTnENPmik92b1N9ocT9tDujaAkafbh++995JIU
9i6YKZaKJNqSj8mSlQsmM5aU8weed+I2JwDOzM9KHlLi56wfxlqIMcZFx3Dn1O6KPSF7V/oC
OK2P+OuHj1uLj9kXnhMJWUSKRJtztXa4IcdC6Yyk7O77H/eH/ba7I2pFrG1X92rJc9oRVkTT
uPxUsMJWSymUKlOWCnlfEq0Jje1dKhRLeGDP0SgiqO3k7f33t3/eTtuXThHnLGOSU6PVuRSB
NY7NUrFY+TksihjVHE6SRFGZErXwy9HYVjCkhCIlPPPRypgzSSSN721lyUK4EbUAyLoNIyEp
C0sdS0ZCbgxJuyP2NEIWFPNIuSe83T9NDp97W9RfhLngSzgiuGTJcI0Ubt+CLVmmlYeZClUW
eUg0awyD3r2A+fUdieZ0UYqMwZ5bdioTZfyAhiEVmb04IOYwhgg59ehl1YrDztltKmpUJIlX
0w3by4n5PC4lU2YzpH8XBwtr5pJLxtJcQ/eZM5uGvhRJkWki771D11KeNTbtqYDmzfbSvPhV
b97+PTnBdCYbmNrbaXN6m2weHw/v+9Nu/6W34dCgJNT00VOfJZe6x8aD9c4SVcwoSifrX43i
3s37hmm3ZgBmxJVIiOZGI8yyJS0myqNSsEUl8Dp1gh8lW4PmWCqmHAnTpkeC261M01qxPawB
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

--BOKacYhQ+x31HxR3--
