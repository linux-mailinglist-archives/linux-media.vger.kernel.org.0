Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58D461504EE
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2020 12:09:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727747AbgBCLJu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Feb 2020 06:09:50 -0500
Received: from mga18.intel.com ([134.134.136.126]:14892 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726369AbgBCLJu (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 3 Feb 2020 06:09:50 -0500
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 03 Feb 2020 03:09:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,397,1574150400"; 
   d="gz'50?scan'50,208,50";a="224253818"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 03 Feb 2020 03:09:44 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1iyZbr-000BqK-Ir; Mon, 03 Feb 2020 19:09:43 +0800
Date:   Mon, 3 Feb 2020 19:09:00 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Brad Love <brad@nextdimension.cc>
Cc:     kbuild-all@lists.01.org, linux-media@vger.kernel.org,
        Brad Love <brad@nextdimension.cc>
Subject: Re: [PATCH 1/3] m88ds3103: Add support for ds3103b demod
Message-ID: <202002031833.UMAtmy8J%lkp@intel.com>
References: <20200201214826.22873-2-brad@nextdimension.cc>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="him7hgsw5iy43fcu"
Content-Disposition: inline
In-Reply-To: <20200201214826.22873-2-brad@nextdimension.cc>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--him7hgsw5iy43fcu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Brad,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linuxtv-media/master]
[also build test WARNING on v5.5 next-20200203]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Brad-Love/m88ds3103-Add-support-for-Montage-3103b-DVB-S-demod/20200203-135639
base:   git://linuxtv.org/media_tree.git master
config: x86_64-randconfig-d002-20200202 (attached as .config)
compiler: gcc-7 (Debian 7.5.0-3) 7.5.0
reproduce:
        # save the attached .config to linux build tree
        make ARCH=x86_64 

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from arch/x86/include/asm/current.h:5:0,
                    from include/linux/sched.h:12,
                    from include/media/dvb_frontend.h:36,
                    from drivers/media/dvb-frontends/m88ds3103_priv.h:11,
                    from drivers/media/dvb-frontends/m88ds3103.c:8:
   drivers/media/dvb-frontends/m88ds3103.c: In function 'm88ds3103_set_frontend':
   include/linux/compiler.h:56:26: warning: this statement may fall through [-Wimplicit-fallthrough=]
    #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                             ^
>> drivers/media/dvb-frontends/m88ds3103.c:906:3: note: in expansion of macro 'if'
      if (dev->chiptype == M88DS3103_CHIPTYPE_3103B) {
      ^~
   drivers/media/dvb-frontends/m88ds3103.c:911:2: note: here
     default:
     ^~~~~~~
   Cyclomatic Complexity 1 arch/x86/include/asm/bitops.h:fls64
   Cyclomatic Complexity 1 include/linux/log2.h:__ilog2_u64
   Cyclomatic Complexity 1 include/linux/math64.h:div_u64_rem
   Cyclomatic Complexity 1 include/linux/math64.h:div_s64_rem
   Cyclomatic Complexity 1 include/linux/math64.h:div_u64
   Cyclomatic Complexity 1 include/linux/math64.h:div_s64
   Cyclomatic Complexity 1 include/linux/err.h:PTR_ERR
   Cyclomatic Complexity 1 include/linux/jiffies.h:_msecs_to_jiffies
   Cyclomatic Complexity 7 include/linux/jiffies.h:msecs_to_jiffies
   Cyclomatic Complexity 4 include/linux/slab.h:kmalloc_type
   Cyclomatic Complexity 84 include/linux/slab.h:kmalloc_index
   Cyclomatic Complexity 1 include/linux/slab.h:kmalloc_large
   Cyclomatic Complexity 10 include/linux/slab.h:kmalloc
   Cyclomatic Complexity 1 include/linux/slab.h:kzalloc
   Cyclomatic Complexity 1 include/linux/device.h:dev_get_drvdata
   Cyclomatic Complexity 1 include/linux/device.h:dev_set_drvdata
   Cyclomatic Complexity 1 include/linux/i2c.h:i2c_get_clientdata
   Cyclomatic Complexity 1 include/linux/i2c.h:i2c_set_clientdata
   Cyclomatic Complexity 1 include/linux/i2c-mux.h:i2c_mux_priv
   Cyclomatic Complexity 1 drivers/media/dvb-frontends/m88ds3103.c:m88ds3103_read_ber
   Cyclomatic Complexity 1 drivers/media/dvb-frontends/m88ds3103.c:m88ds3103_get_tune_settings
   Cyclomatic Complexity 1 drivers/media/dvb-frontends/m88ds3103.c:m88ds3103_get_dvb_frontend
   Cyclomatic Complexity 1 drivers/media/dvb-frontends/m88ds3103.c:m88ds3103_get_i2c_adapter
   Cyclomatic Complexity 4 drivers/media/dvb-frontends/m88ds3103.c:m88ds3103_get_agc_pwm
   Cyclomatic Complexity 4 drivers/media/dvb-frontends/m88ds3103.c:m88ds3103_read_snr
   Cyclomatic Complexity 74 include/asm-generic/getorder.h:get_order
   Cyclomatic Complexity 3 include/linux/err.h:IS_ERR_OR_NULL
   Cyclomatic Complexity 3 include/linux/i2c.h:i2c_client_has_driver
   Cyclomatic Complexity 3 drivers/media/dvb-frontends/m88ds3103.c:m88ds3103_attach
   Cyclomatic Complexity 1 include/linux/err.h:IS_ERR
   Cyclomatic Complexity 1 drivers/media/dvb-frontends/m88ds3103.c:m88ds3103_driver_init
   Cyclomatic Complexity 1 drivers/media/dvb-frontends/m88ds3103.c:m88ds3103_release
   Cyclomatic Complexity 4 drivers/media/dvb-frontends/m88ds3103.c:m88ds3103_remove
   Cyclomatic Complexity 19 drivers/media/dvb-frontends/m88ds3103.c:m88ds3103_wr_reg_val_tab
   Cyclomatic Complexity 56 drivers/media/dvb-frontends/m88ds3103.c:m88ds3103_get_frontend
   Cyclomatic Complexity 7 drivers/media/dvb-frontends/m88ds3103.c:m88ds3103_update_bits
   Cyclomatic Complexity 56 drivers/media/dvb-frontends/m88ds3103.c:m88ds3103_probe
   Cyclomatic Complexity 10 drivers/media/dvb-frontends/m88ds3103.c:m88ds3103_set_voltage
   Cyclomatic Complexity 12 drivers/media/dvb-frontends/m88ds3103.c:m88ds3103_set_tone
   Cyclomatic Complexity 31 drivers/media/dvb-frontends/m88ds3103.c:m88ds3103_diseqc_send_burst
   Cyclomatic Complexity 35 drivers/media/dvb-frontends/m88ds3103.c:m88ds3103_diseqc_send_master_cmd
   Cyclomatic Complexity 16 drivers/media/dvb-frontends/m88ds3103.c:m88ds3103_sleep
   Cyclomatic Complexity 82 drivers/media/dvb-frontends/m88ds3103.c:m88ds3103_read_status
   Cyclomatic Complexity 6 drivers/media/dvb-frontends/m88ds3103.c:m88ds3103b_dt_read
   Cyclomatic Complexity 6 drivers/media/dvb-frontends/m88ds3103.c:m88ds3103b_dt_write
   Cyclomatic Complexity 30 drivers/media/dvb-frontends/m88ds3103.c:m88ds3103b_select_mclk
   Cyclomatic Complexity 79 drivers/media/dvb-frontends/m88ds3103.c:m88ds3103b_set_mclk
   Cyclomatic Complexity 210 drivers/media/dvb-frontends/m88ds3103.c:m88ds3103_set_frontend
   Cyclomatic Complexity 50 drivers/media/dvb-frontends/m88ds3103.c:m88ds3103_init
   Cyclomatic Complexity 7 drivers/media/dvb-frontends/m88ds3103.c:m88ds3103_select
   Cyclomatic Complexity 1 drivers/media/dvb-frontends/m88ds3103.c:m88ds3103_driver_exit

vim +/if +906 drivers/media/dvb-frontends/m88ds3103.c

   623	
   624	static int m88ds3103_set_frontend(struct dvb_frontend *fe)
   625	{
   626		struct m88ds3103_dev *dev = fe->demodulator_priv;
   627		struct i2c_client *client = dev->client;
   628		struct dtv_frontend_properties *c = &fe->dtv_property_cache;
   629		int ret, len;
   630		const struct m88ds3103_reg_val *init;
   631		u8 u8tmp, u8tmp1 = 0, u8tmp2 = 0; /* silence compiler warning */
   632		u8 buf[3];
   633		u16 u16tmp;
   634		u32 tuner_frequency_khz, target_mclk, u32tmp;
   635		s32 s32tmp;
   636		static const struct reg_sequence reset_buf[] = {
   637			{0x07, 0x80}, {0x07, 0x00}
   638		};
   639	
   640		dev_dbg(&client->dev,
   641			"delivery_system=%d modulation=%d frequency=%u symbol_rate=%d inversion=%d pilot=%d rolloff=%d\n",
   642			c->delivery_system, c->modulation, c->frequency, c->symbol_rate,
   643			c->inversion, c->pilot, c->rolloff);
   644	
   645		if (!dev->warm) {
   646			ret = -EAGAIN;
   647			goto err;
   648		}
   649	
   650		/* reset */
   651		ret = regmap_multi_reg_write(dev->regmap, reset_buf, 2);
   652		if (ret)
   653			goto err;
   654	
   655		/* Disable demod clock path */
   656		if (dev->chip_id == M88RS6000_CHIP_ID) {
   657			if (dev->chiptype == M88DS3103_CHIPTYPE_3103B) {
   658				ret = regmap_read(dev->regmap, 0xb2, &u32tmp);
   659				if (ret)
   660					goto err;
   661				if (u32tmp == 0x01) {
   662					ret = regmap_write(dev->regmap, 0x00, 0x00);
   663					if (ret)
   664						goto err;
   665					ret = regmap_write(dev->regmap, 0xb2, 0x00);
   666					if (ret)
   667						goto err;
   668				}
   669			}
   670	
   671			ret = regmap_write(dev->regmap, 0x06, 0xe0);
   672			if (ret)
   673				goto err;
   674		}
   675	
   676		/* program tuner */
   677		if (fe->ops.tuner_ops.set_params) {
   678			ret = fe->ops.tuner_ops.set_params(fe);
   679			if (ret)
   680				goto err;
   681		}
   682	
   683		if (fe->ops.tuner_ops.get_frequency) {
   684			ret = fe->ops.tuner_ops.get_frequency(fe, &tuner_frequency_khz);
   685			if (ret)
   686				goto err;
   687		} else {
   688			/*
   689			 * Use nominal target frequency as tuner driver does not provide
   690			 * actual frequency used. Carrier offset calculation is not
   691			 * valid.
   692			 */
   693			tuner_frequency_khz = c->frequency;
   694		}
   695	
   696		/* set M88RS6000/DS3103B demod main mclk and ts mclk from tuner die */
   697		if (dev->chip_id == M88RS6000_CHIP_ID) {
   698			if (c->symbol_rate > 45010000)
   699				dev->mclk = 110250000;
   700			else
   701				dev->mclk = 96000000;
   702	
   703			if (c->delivery_system == SYS_DVBS)
   704				target_mclk = 96000000;
   705			else
   706				target_mclk = 144000000;
   707	
   708			if (dev->chiptype == M88DS3103_CHIPTYPE_3103B) {
   709				m88ds3103b_select_mclk(dev);
   710				m88ds3103b_set_mclk(dev, target_mclk / 1000);
   711			}
   712	
   713			/* Enable demod clock path */
   714			ret = regmap_write(dev->regmap, 0x06, 0x00);
   715			if (ret)
   716				goto err;
   717			usleep_range(10000, 20000);
   718		} else {
   719		/* set M88DS3103 mclk and ts mclk. */
   720			dev->mclk = 96000000;
   721	
   722			switch (dev->cfg->ts_mode) {
   723			case M88DS3103_TS_SERIAL:
   724			case M88DS3103_TS_SERIAL_D7:
   725				target_mclk = dev->cfg->ts_clk;
   726				break;
   727			case M88DS3103_TS_PARALLEL:
   728			case M88DS3103_TS_CI:
   729				if (c->delivery_system == SYS_DVBS)
   730					target_mclk = 96000000;
   731				else {
   732					if (c->symbol_rate < 18000000)
   733						target_mclk = 96000000;
   734					else if (c->symbol_rate < 28000000)
   735						target_mclk = 144000000;
   736					else
   737						target_mclk = 192000000;
   738				}
   739				break;
   740			default:
   741				dev_dbg(&client->dev, "invalid ts_mode\n");
   742				ret = -EINVAL;
   743				goto err;
   744			}
   745	
   746			switch (target_mclk) {
   747			case 96000000:
   748				u8tmp1 = 0x02; /* 0b10 */
   749				u8tmp2 = 0x01; /* 0b01 */
   750				break;
   751			case 144000000:
   752				u8tmp1 = 0x00; /* 0b00 */
   753				u8tmp2 = 0x01; /* 0b01 */
   754				break;
   755			case 192000000:
   756				u8tmp1 = 0x03; /* 0b11 */
   757				u8tmp2 = 0x00; /* 0b00 */
   758				break;
   759			}
   760			ret = m88ds3103_update_bits(dev, 0x22, 0xc0, u8tmp1 << 6);
   761			if (ret)
   762				goto err;
   763			ret = m88ds3103_update_bits(dev, 0x24, 0xc0, u8tmp2 << 6);
   764			if (ret)
   765				goto err;
   766		}
   767	
   768		ret = regmap_write(dev->regmap, 0xb2, 0x01);
   769		if (ret)
   770			goto err;
   771	
   772		ret = regmap_write(dev->regmap, 0x00, 0x01);
   773		if (ret)
   774			goto err;
   775	
   776		switch (c->delivery_system) {
   777		case SYS_DVBS:
   778			if (dev->chip_id == M88RS6000_CHIP_ID) {
   779				len = ARRAY_SIZE(m88rs6000_dvbs_init_reg_vals);
   780				init = m88rs6000_dvbs_init_reg_vals;
   781			} else {
   782				len = ARRAY_SIZE(m88ds3103_dvbs_init_reg_vals);
   783				init = m88ds3103_dvbs_init_reg_vals;
   784			}
   785			break;
   786		case SYS_DVBS2:
   787			if (dev->chip_id == M88RS6000_CHIP_ID) {
   788				len = ARRAY_SIZE(m88rs6000_dvbs2_init_reg_vals);
   789				init = m88rs6000_dvbs2_init_reg_vals;
   790			} else {
   791				len = ARRAY_SIZE(m88ds3103_dvbs2_init_reg_vals);
   792				init = m88ds3103_dvbs2_init_reg_vals;
   793			}
   794			break;
   795		default:
   796			dev_dbg(&client->dev, "invalid delivery_system\n");
   797			ret = -EINVAL;
   798			goto err;
   799		}
   800	
   801		/* program init table */
   802		if (c->delivery_system != dev->delivery_system) {
   803			ret = m88ds3103_wr_reg_val_tab(dev, init, len);
   804			if (ret)
   805				goto err;
   806		}
   807	
   808		if (dev->chip_id == M88RS6000_CHIP_ID) {
   809			if (c->delivery_system == SYS_DVBS2 &&
   810			    c->symbol_rate <= 5000000) {
   811				ret = regmap_write(dev->regmap, 0xc0, 0x04);
   812				if (ret)
   813					goto err;
   814				buf[0] = 0x09;
   815				buf[1] = 0x22;
   816				buf[2] = 0x88;
   817				ret = regmap_bulk_write(dev->regmap, 0x8a, buf, 3);
   818				if (ret)
   819					goto err;
   820			}
   821			ret = m88ds3103_update_bits(dev, 0x9d, 0x08, 0x08);
   822			if (ret)
   823				goto err;
   824	
   825			if (dev->chiptype == M88DS3103_CHIPTYPE_3103B) {
   826				buf[0] = m88ds3103b_dt_read(dev, 0x15);
   827				buf[1] = m88ds3103b_dt_read(dev, 0x16);
   828	
   829				if (c->symbol_rate > 45010000) {
   830					buf[0] &= ~0x03;
   831					buf[0] |= 0x02;
   832					buf[0] |= ((147 - 32) >> 8) & 0x01;
   833					buf[1] = (147 - 32) & 0xFF;
   834	
   835					dev->mclk = 110250 * 1000;
   836				} else {
   837					buf[0] &= ~0x03;
   838					buf[0] |= ((128 - 32) >> 8) & 0x01;
   839					buf[1] = (128 - 32) & 0xFF;
   840	
   841					dev->mclk = 96000 * 1000;
   842				}
   843				m88ds3103b_dt_write(dev, 0x15, buf[0]);
   844				m88ds3103b_dt_write(dev, 0x16, buf[1]);
   845	
   846				regmap_read(dev->regmap, 0x30, &u32tmp);
   847				u32tmp &= ~0x80;
   848				regmap_write(dev->regmap, 0x30, u32tmp & 0xff);
   849			}
   850	
   851			ret = regmap_write(dev->regmap, 0xf1, 0x01);
   852			if (ret)
   853				goto err;
   854	
   855			if (dev->chiptype != M88DS3103_CHIPTYPE_3103B) {
   856				ret = m88ds3103_update_bits(dev, 0x30, 0x80, 0x80);
   857				if (ret)
   858					goto err;
   859			}
   860		}
   861	
   862		switch (dev->cfg->ts_mode) {
   863		case M88DS3103_TS_SERIAL:
   864			u8tmp1 = 0x00;
   865			u8tmp = 0x06;
   866			break;
   867		case M88DS3103_TS_SERIAL_D7:
   868			u8tmp1 = 0x20;
   869			u8tmp = 0x06;
   870			break;
   871		case M88DS3103_TS_PARALLEL:
   872			u8tmp = 0x02;
   873			if (dev->chiptype == M88DS3103_CHIPTYPE_3103B) {
   874				u8tmp = 0x01;
   875				u8tmp1 = 0x01;
   876			}
   877			break;
   878		case M88DS3103_TS_CI:
   879			u8tmp = 0x03;
   880			break;
   881		default:
   882			dev_dbg(&client->dev, "invalid ts_mode\n");
   883			ret = -EINVAL;
   884			goto err;
   885		}
   886	
   887		if (dev->cfg->ts_clk_pol)
   888			u8tmp |= 0x40;
   889	
   890		/* TS mode */
   891		ret = regmap_write(dev->regmap, 0xfd, u8tmp);
   892		if (ret)
   893			goto err;
   894	
   895		switch (dev->cfg->ts_mode) {
   896		case M88DS3103_TS_SERIAL:
   897		case M88DS3103_TS_SERIAL_D7:
   898			ret = m88ds3103_update_bits(dev, 0x29, 0x20, u8tmp1);
   899			if (ret)
   900				goto err;
   901			u16tmp = 0;
   902			u8tmp1 = 0x3f;
   903			u8tmp2 = 0x3f;
   904			break;
   905		case M88DS3103_TS_PARALLEL:
 > 906			if (dev->chiptype == M88DS3103_CHIPTYPE_3103B) {
   907				ret = m88ds3103_update_bits(dev, 0x29, 0x01, u8tmp1);
   908				if (ret)
   909					goto err;
   910			}
   911		default:
   912			u16tmp = DIV_ROUND_UP(target_mclk, dev->cfg->ts_clk);
   913			u8tmp1 = u16tmp / 2 - 1;
   914			u8tmp2 = DIV_ROUND_UP(u16tmp, 2) - 1;
   915		}
   916	
   917		dev_dbg(&client->dev, "target_mclk=%u ts_clk=%u ts_clk_divide_ratio=%u\n",
   918			target_mclk, dev->cfg->ts_clk, u16tmp);
   919	
   920		/* u8tmp1[5:2] => fe[3:0], u8tmp1[1:0] => ea[7:6] */
   921		/* u8tmp2[5:0] => ea[5:0] */
   922		u8tmp = (u8tmp1 >> 2) & 0x0f;
   923		ret = regmap_update_bits(dev->regmap, 0xfe, 0x0f, u8tmp);
   924		if (ret)
   925			goto err;
   926		u8tmp = ((u8tmp1 & 0x03) << 6) | u8tmp2 >> 0;
   927		ret = regmap_write(dev->regmap, 0xea, u8tmp);
   928		if (ret)
   929			goto err;
   930	
   931		if (c->symbol_rate <= 3000000)
   932			u8tmp = 0x20;
   933		else if (c->symbol_rate <= 10000000)
   934			u8tmp = 0x10;
   935		else
   936			u8tmp = 0x06;
   937	
   938		if (dev->chiptype == M88DS3103_CHIPTYPE_3103B)
   939			m88ds3103b_set_mclk(dev, target_mclk / 1000);
   940	
   941		ret = regmap_write(dev->regmap, 0xc3, 0x08);
   942		if (ret)
   943			goto err;
   944	
   945		ret = regmap_write(dev->regmap, 0xc8, u8tmp);
   946		if (ret)
   947			goto err;
   948	
   949		ret = regmap_write(dev->regmap, 0xc4, 0x08);
   950		if (ret)
   951			goto err;
   952	
   953		ret = regmap_write(dev->regmap, 0xc7, 0x00);
   954		if (ret)
   955			goto err;
   956	
   957		u16tmp = DIV_ROUND_CLOSEST_ULL((u64)c->symbol_rate * 0x10000, dev->mclk);
   958		buf[0] = (u16tmp >> 0) & 0xff;
   959		buf[1] = (u16tmp >> 8) & 0xff;
   960		ret = regmap_bulk_write(dev->regmap, 0x61, buf, 2);
   961		if (ret)
   962			goto err;
   963	
   964		ret = m88ds3103_update_bits(dev, 0x4d, 0x02, dev->cfg->spec_inv << 1);
   965		if (ret)
   966			goto err;
   967	
   968		ret = m88ds3103_update_bits(dev, 0x30, 0x10, dev->cfg->agc_inv << 4);
   969		if (ret)
   970			goto err;
   971	
   972		ret = regmap_write(dev->regmap, 0x33, dev->cfg->agc);
   973		if (ret)
   974			goto err;
   975	
   976		if (dev->chiptype == M88DS3103_CHIPTYPE_3103B) {
   977			/* enable/disable 192M LDPC clock */
   978			ret = m88ds3103_update_bits(dev, 0x29, 0x10,
   979						(c->delivery_system == SYS_DVBS) ? 0x10 : 0x0);
   980			if (ret)
   981				goto err;
   982	
   983			ret = m88ds3103_update_bits(dev, 0xc9, 0x08, 0x08);
   984		}
   985	
   986		dev_dbg(&client->dev, "carrier offset=%d\n",
   987			(tuner_frequency_khz - c->frequency));
   988	
   989		/* Use 32-bit calc as there is no s64 version of DIV_ROUND_CLOSEST() */
   990		s32tmp = 0x10000 * (tuner_frequency_khz - c->frequency);
   991		s32tmp = DIV_ROUND_CLOSEST(s32tmp, dev->mclk / 1000);
   992		buf[0] = (s32tmp >> 0) & 0xff;
   993		buf[1] = (s32tmp >> 8) & 0xff;
   994		ret = regmap_bulk_write(dev->regmap, 0x5e, buf, 2);
   995		if (ret)
   996			goto err;
   997	
   998		ret = regmap_write(dev->regmap, 0x00, 0x00);
   999		if (ret)
  1000			goto err;
  1001	
  1002		ret = regmap_write(dev->regmap, 0xb2, 0x00);
  1003		if (ret)
  1004			goto err;
  1005	
  1006		dev->delivery_system = c->delivery_system;
  1007	
  1008		return 0;
  1009	err:
  1010		dev_dbg(&client->dev, "failed=%d\n", ret);
  1011		return ret;
  1012	}
  1013	

---
0-DAY kernel test infrastructure                 Open Source Technology Center
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org Intel Corporation

--him7hgsw5iy43fcu
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
ctj4H8TncxOb0wEA

--him7hgsw5iy43fcu--
