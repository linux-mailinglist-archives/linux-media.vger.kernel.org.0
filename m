Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B12A11F7ED1
	for <lists+linux-media@lfdr.de>; Sat, 13 Jun 2020 00:15:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726290AbgFLWPr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Jun 2020 18:15:47 -0400
Received: from mga12.intel.com ([192.55.52.136]:53015 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726302AbgFLWPq (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Jun 2020 18:15:46 -0400
IronPort-SDR: QkuDNl9NIGIbu1V1se7Vzqsj+D4lG6970Ts/Nj/ZVOcOSZFnp+D9q5z5QotoeRdsIT/6zUmz3N
 QgQiPfQKJXUQ==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2020 14:50:42 -0700
IronPort-SDR: 9QnW1ET4Uitpe77VPJ7q6de2WV0+KOBTAcHBuXsG5cV8xDFmcAxRE1DP7heMlta/Equ0VBBN9N
 ZkGfz7OufeTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,504,1583222400"; 
   d="gz'50?scan'50,208,50";a="260058109"
Received: from lkp-server02.sh.intel.com (HELO de5642daf266) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 12 Jun 2020 14:50:40 -0700
Received: from kbuild by de5642daf266 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jjrZQ-00007r-0C; Fri, 12 Jun 2020 21:50:40 +0000
Date:   Sat, 13 Jun 2020 05:49:55 +0800
From:   kernel test robot <lkp@intel.com>
To:     Brad Love <brad@nextdimension.cc>, linux-media@vger.kernel.org
Cc:     kbuild-all@lists.01.org, Brad Love <brad@nextdimension.cc>
Subject: Re: [PATCH 1/3] mxl692: MaxLinear 692 ATSC demod-tuner driver
Message-ID: <202006130511.My5DY4lL%lkp@intel.com>
References: <20200612183937.10952-2-3126054018@nextdimension.cc>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="ReaqsoxgOBHFXBhH"
Content-Disposition: inline
In-Reply-To: <20200612183937.10952-2-3126054018@nextdimension.cc>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--ReaqsoxgOBHFXBhH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Brad,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linuxtv-media/master]
[also build test WARNING on v5.7 next-20200612]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Brad-Love/MaxLinear-mxl692-demod-tuner-Hauppauge-usb-QuadHD/20200613-024056
base:   git://linuxtv.org/media_tree.git master
config: i386-randconfig-s002-20200612 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-13) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-250-g42323db3-dirty
        # save the attached .config to linux build tree
        make W=1 C=1 ARCH=i386 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/media/dvb-frontends/mxl692.c:223:27: sparse: sparse: invalid assignment: +=
>> drivers/media/dvb-frontends/mxl692.c:223:27: sparse:    left side has type unsigned int
>> drivers/media/dvb-frontends/mxl692.c:223:27: sparse:    right side has type restricted __be32
   drivers/media/dvb-frontends/mxl692.c:227:27: sparse: sparse: invalid assignment: +=
   drivers/media/dvb-frontends/mxl692.c:227:27: sparse:    left side has type unsigned int
   drivers/media/dvb-frontends/mxl692.c:227:27: sparse:    right side has type restricted __be32
>> drivers/media/dvb-frontends/mxl692.c:231:16: sparse: sparse: cast to restricted __be32
>> drivers/media/dvb-frontends/mxl692.c:231:16: sparse: sparse: cast to restricted __be32
>> drivers/media/dvb-frontends/mxl692.c:231:16: sparse: sparse: cast to restricted __be32
>> drivers/media/dvb-frontends/mxl692.c:231:16: sparse: sparse: cast to restricted __be32
>> drivers/media/dvb-frontends/mxl692.c:231:16: sparse: sparse: cast to restricted __be32
>> drivers/media/dvb-frontends/mxl692.c:231:16: sparse: sparse: cast to restricted __be32
>> drivers/media/dvb-frontends/mxl692.c:249:14: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] temp @@     got restricted __be32 [usertype] @@
>> drivers/media/dvb-frontends/mxl692.c:249:14: sparse:     expected unsigned int [usertype] temp
>> drivers/media/dvb-frontends/mxl692.c:249:14: sparse:     got restricted __be32 [usertype]
>> drivers/media/dvb-frontends/mxl692.c:293:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
>> drivers/media/dvb-frontends/mxl692.c:293:44: sparse:     expected unsigned int [usertype]
>> drivers/media/dvb-frontends/mxl692.c:293:44: sparse:     got restricted __le32 [usertype]

vim +223 drivers/media/dvb-frontends/mxl692.c

   217	
   218	static u32 mxl692_checksum(u8 *buffer, u32 size)
   219	{
   220		u32 ix, remainder = 0, cur_cksum = 0;
   221	
   222		for (ix = 0; ix < size / 4; ix++)
 > 223			cur_cksum += cpu_to_be32(*(u32 *)(buffer +
   224						 (ix * sizeof(u32))));
   225		remainder = size % 4;
   226		if (remainder > 0)
   227			cur_cksum += cpu_to_be32(*((u32 *)&buffer[size - remainder]));
   228	
   229		cur_cksum ^= 0xDEADBEEF;
   230	
 > 231		return be32_to_cpu(cur_cksum);
   232	}
   233	
   234	static int mxl692_validate_fw_header(const u8 *buffer, u32 buf_len)
   235	{
   236		int status = 0;
   237		u32 ix, temp = 0;
   238		u32 *local_buf = NULL;
   239	
   240		if (buffer[0] != 0x4D || buffer[1] != 0x31 ||
   241		    buffer[2] != 0x10 || buffer[3] != 0x02 ||
   242		    buffer[4] != 0x40 || buffer[5] != 0x00 ||
   243		    buffer[6] != 0x00 || buffer[7] != 0x80) {
   244			status = -EINVAL;
   245			goto err_finish;
   246		}
   247	
   248		local_buf = (u32 *)(buffer + 8);
 > 249		temp = cpu_to_be32(*(u32 *)local_buf);
   250	
   251		if ((buf_len - 16) != (temp >> 8)) {
   252			status = -EINVAL;
   253			goto err_finish;
   254		}
   255	
   256		temp = 0;
   257		for (ix = 16; ix < buf_len; ix++)
   258			temp += buffer[ix];
   259	
   260		if ((u8)temp != buffer[11])
   261			status = -EINVAL;
   262	err_finish:
   263		if (status)
   264			pr_err("%s failed! %d\n", __func__, status);
   265		return status;
   266	}
   267	
   268	static int mxl692_write_fw_block(struct mxl692_dev *dev, const u8 *buffer,
   269					 u32 buf_len, u32 *index)
   270	{
   271		int status = 0;
   272		u32 ix = 0, total_len = 0, addr = 0, chunk_len = 0, prevchunk_len = 0;
   273		u8 local_buf[MXL_EAGLE_MAX_I2C_PACKET_SIZE] = {}, *plocal_buf = NULL;
   274		int payload_max = MXL_EAGLE_MAX_I2C_PACKET_SIZE - MXL_EAGLE_I2C_MHEADER_SIZE;
   275	
   276		ix = *index;
   277	
   278		if (buffer[ix] == 0x53) {
   279			total_len = buffer[ix + 1] << 16 | buffer[ix + 2] << 8 | buffer[ix + 3];
   280			total_len = (total_len + 3) & ~3;
   281			addr     = buffer[ix + 4] << 24 | buffer[ix + 5] << 16 |
   282				   buffer[ix + 6] << 8 | buffer[ix + 7];
   283			ix      += MXL_EAGLE_FW_SEGMENT_HEADER_SIZE;
   284	
   285			while ((total_len > 0) && (status == 0)) {
   286				plocal_buf = local_buf;
   287				chunk_len  = (total_len < payload_max) ?
   288						total_len : payload_max;
   289	
   290				*plocal_buf++ = 0xFC;
   291				*plocal_buf++ = chunk_len + sizeof(u32);
   292	
 > 293				*(u32 *)plocal_buf = cpu_to_le32(addr + prevchunk_len);
   294				plocal_buf += sizeof(u32);
   295	
   296				memcpy(plocal_buf, &buffer[ix], chunk_len);
   297				convert_endian(chunk_len, plocal_buf);
   298	
   299				if (mxl692_i2c_write(dev, local_buf,
   300				    (chunk_len + MXL_EAGLE_I2C_MHEADER_SIZE)) < 0) {
   301					status = -EREMOTEIO;
   302					break;
   303				}
   304	
   305				prevchunk_len += chunk_len;
   306				total_len -= chunk_len;
   307				ix += chunk_len;
   308			}
   309			*index = ix;
   310		} else {
   311			status = -EINVAL;
   312		}
   313	
   314		if (status)
   315			dev_err(&dev->i2c_client->dev, "err %d\n", status);
   316	
   317		return status;
   318	}
   319	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--ReaqsoxgOBHFXBhH
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--ReaqsoxgOBHFXBhH--
